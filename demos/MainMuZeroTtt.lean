module

public import LeanMlir.Train
public import LeanMlir.TicTacToe
public import Std.Data.HashSet
public import LeanMlir.CliArgs

@[expose] public section

/-! MuZero on the Lean tic-tac-toe: planning without the rules, the learned model scored
    against the solved game (`planning/muzero_ttt_demo.md`).

    Schrittwieser et al. 2020's loop on `LeanMlir/TicTacToe.lean`. AlphaZero's demo
    (`demos/MainAlphaZeroTtt.lean`) is handed `Pos.play`; this one learns a model of it and
    searches inside the model. Four plain conv nets at board size `n`, latent `[C, n, n]`
    (§3): the representation `h` (the board's two planes → latent), the dynamics `g`
    (latent + the move as one more plane → the next latent), the prediction `f` (latent →
    `n² + 1` slots, AlphaZero's policy logits and value pre-tanh) and the reward `r` (the
    next latent → the move's reward pre-tanh). Each latent is min–max normalised to [0, 1]
    per example in C, with its VJP (`lean_muz_minmax[_back]`).

    The search (`lean_muz_*` in `ffi/f32_helpers.c`) is PUCT in the latent: the real rules
    mask the root's moves and nothing else, so a line inside the tree can play an occupied
    cell, and only the model can say the game has ended. Every batched forward runs in
    lockstep over `bf` games, as AlphaZero's does.

    Training samples a position from the replay window and the next `K` moves of its game,
    unrolls `h` then `g` `K` times, and asks `f` at every step and `r` after every move for
    the search's visit distribution, the game's outcome and the move's reward (absorbing
    past the end: uniform policy, value and reward 0). The loss is §4's,
    `Σ_k (z_k − v_k)² − π_kᵀ log p_k + Σ_{k≥1} (u_k − r_k)²`, each unrolled step's terms at
    1/K and the cotangent entering each `g` halved (the paper's two scalings). The backward
    runs the unroll in reverse through each net's own VJP module
    (`MlirCodegen.generateVjp`), sums `g`'s `K` parameter gradients, and applies Adam per net
    (`generateApplyAdam`).

    Two gates before training means anything:
    - `mode=oracle` — the latent search with the TRUE dynamics (the next real position
      through an AlphaZero net split into a representation and a prediction half) against
      `lean_mcts_*` on the same net, at every reachable decision position: the root visit
      counts equal at `sims ≤ 6` (the first transposition needs seven), and their distance
      reported at full depth.
    - `mode=dump` — one training batch's inputs, targets and four parameter gradients
      written under `.lake/build/muz_unroll/`, for `scripts/probes/muz_unroll_gate.py` to
      check against `jax.grad` of the same unrolled loss.

    `lake exe muzero-ttt [mode=train|oracle|dump] [n=3] [k=n] [C=32] [K=5] [iters=20]
     [sims=25] [bf=256] [batch=64] [epochs=10] [lr=1e-3] [window=20] [cpuct=1.25]
     [alpha=1.0] [noise=0.25] [tempPlies=n²] [seed=1] [tag=<name>] [params=<file>]
     [azParams=<file>] [oracleSims=2,3,4,5,6,<sims>]`;
    writes `<prefix>_curve.csv` and `<prefix>_params.bin` (h, g, f, r back to back) under
    `.lake/build/`. Either backend: XLA, or IREE (`LEAN_MLIR_LOWERER=iree
    IREE_BACKEND=llvm-cpu` runs it on a CPU). n ≤ 4 (the dense table). -/

open FloatFmt TTT

namespace MuZeroTtt

-- ── The networks (§3) ──

/-- `h`: the board's two planes → the latent `[C, n, n]`. The last conv is linear; the
    latent is min–max normalised on the host. -/
def hNet (n C : Nat) : NetSpec where
  name := s!"muzero ttt h {n}x{n} c{C}"
  imageH := n
  imageW := n
  layers := [.conv2d 2 64 3 .same .relu, .conv2d 64 64 3 .same .relu, .conv2d 64 C 3 .same .identity]

/-- `g`: the latent and the move's one-hot plane → the next latent. -/
def gNet (n C : Nat) : NetSpec where
  name := s!"muzero ttt g {n}x{n} c{C}"
  imageH := n
  imageW := n
  layers := [.conv2d (C + 1) 64 3 .same .relu, .conv2d 64 64 3 .same .relu, .conv2d 64 C 3 .same .identity]

/-- `f`: the latent → AlphaZero's merged head, policy logits in slots `0 .. n²−1`, the value
    pre-tanh in slot `n²`. -/
def fNet (n C : Nat) : NetSpec where
  name := s!"muzero ttt f {n}x{n} c{C}"
  imageH := n
  imageW := n
  layers := [.conv2d C 4 1 .same .relu, .flatten, .dense (4 * n * n) 64 .relu, .dense 64 (n * n + 1) .identity]

/-- `r`: the latent after a move → the move's reward pre-tanh, from its mover's view. -/
def rNet (n C : Nat) : NetSpec where
  name := s!"muzero ttt r {n}x{n} c{C}"
  imageH := n
  imageW := n
  layers := [.conv2d C 4 1 .same .relu, .flatten, .dense (4 * n * n) 64 .relu, .dense 64 1 .identity]

/-- AlphaZero's net (`AlphaZeroTtt.net`), cut after its trunk for the oracle gate: the trunk
    is a representation into a `[64, n, n]` latent, the head a prediction from it. The
    parameters are laid out in layer order, so the trunk's are a prefix of the whole net's. -/
def azH (n : Nat) : NetSpec where
  name := s!"muzero oracle az trunk {n}x{n}"
  imageH := n
  imageW := n
  layers := [.conv2d 2 64 3 .same .relu, .conv2d 64 64 3 .same .relu, .conv2d 64 64 3 .same .relu]

def azF (n : Nat) : NetSpec where
  name := s!"muzero oracle az head {n}x{n}"
  imageH := n
  imageW := n
  layers := [.conv2d 64 4 1 .same .relu, .flatten, .dense (4 * n * n) 64 .relu, .dense 64 (n * n + 1) .identity]

-- ── The C side (`lean_muz_*`, `lean_mcts_*` in ffi/f32_helpers.c) ──

/-- The latent search's arena: `G` games at board `n`, latent `C` channels, `cap` nodes. -/
@[extern "lean_muz_alloc"]
opaque muzAlloc (G n C cap : USize) : IO ByteArray

/-- A fresh tree per live game, its root from row `r` of each block (the `r`-th live game):
    latent, prediction logits, legal mask (u8 per cell), key (u64; empty means 0). -/
@[extern "lean_muz_roots"]
opaque muzRoots (arena live lat logits : @& ByteArray) (nOut : USize) (masks keys : @& ByteArray)
    (noise : UInt8) (alpha eps : Float) (seed : UInt64) : IO Unit

/-- One descent per live game: `G` records of 24 bytes `{u32 kind, i32 node, i32 action,
    u32 depth, u64 key}`; kind 1 an edge to expand, 2 a terminal node reached. -/
@[extern "lean_muz_select"]
opaque muzSelect (arena live : @& ByteArray) (cpuct : Float) (minmax : UInt8) : IO ByteArray

/-- The dynamics input `[rows, C+1, n, n]` for every edge to expand, in game order. -/
@[extern "lean_muz_gather"]
opaque muzGather (arena : @& ByteArray) : IO ByteArray

/-- Expand the pending edges from row `r` of each block and back every value up. -/
@[extern "lean_muz_expand_backup"]
opaque muzExpandBackup (arena lat logits : @& ByteArray) (nOut : USize) (reward : @& ByteArray)
    (rtanh : UInt8) (masks term keys : @& ByteArray) : IO Unit

/-- The roots' visit distributions, f32 `[G, n²]`. -/
@[extern "lean_muz_root_visits"]
opaque muzRootVisits (arena : @& ByteArray) : IO ByteArray

/-- Per game the principal line, u8 `[G, maxLen + 1]`: its length, then its moves. -/
@[extern "lean_muz_principal"]
opaque muzPrincipal (arena : @& ByteArray) (maxLen : USize) : IO ByteArray

@[extern "lean_muz_minmax"]
opaque minmax (x : @& ByteArray) (B D : USize) : IO ByteArray

@[extern "lean_muz_minmax_clamped"]
opaque minmaxClamped (x : @& ByteArray) (B D : USize) : IO USize

@[extern "lean_muz_minmax_back"]
opaque minmaxBack (x g : @& ByteArray) (B D : USize) : IO ByteArray

/-- A head's output cotangent and its loss terms `[Σ w·value, Σ w·policy]`. -/
@[extern "lean_muz_heads_grad"]
opaque headsGrad (out pi z w : @& ByteArray) (B nOut nc : USize) : IO (ByteArray × ByteArray)

@[extern "lean_muz_with_action"]
opaque withAction (s a : @& ByteArray) (B C nc : USize) : IO ByteArray

@[extern "lean_muz_latent_grad"]
opaque latentGrad (d : @& ByteArray) (B C nc : USize) (scale : Float) : IO ByteArray

-- AlphaZero's position-keyed search, the oracle gate's reference (`AlphaZeroTtt.mcts*`).
@[extern "lean_mcts_alloc"]
opaque mctsAlloc (G n k cap : USize) : IO ByteArray
@[extern "lean_mcts_reset"]
opaque mctsReset (arena : @& ByteArray) : IO Unit
@[extern "lean_mcts_select"]
opaque mctsSelect (arena roots live : @& ByteArray) (cpuct : Float) : IO ByteArray
@[extern "lean_mcts_expand_backup"]
opaque mctsExpandBackup (arena logits : @& ByteArray) (nOut : USize) (noise : UInt8)
    (alpha eps : Float) (seed : UInt64) : IO Unit
@[extern "lean_mcts_root_visits"]
opaque mctsRootVisits (arena roots : @& ByteArray) : IO ByteArray

-- ── One network's four graphs ──

/-- A net and its compiled graphs: the eval forward at the training batch `B` and at the
    search's `bf`, the VJP at `B`, the Adam apply. -/
structure Net where
  spec : NetSpec
  B : Nat
  bf : Nat
  outShape : Nat → Array Nat
  evalB : LowererSession
  evalF : LowererSession
  vjpS : LowererSession
  adamS : LowererSession

def Net.nP (net : Net) : Nat := net.spec.totalParams
def Net.inDim (net : Net) : Nat := MlirCodegen.inputFlatDim net.spec
def Net.outDim (net : Net) : Nat := (net.outShape 1).foldl (· * ·) 1
def Net.slug (net : Net) : String := net.spec.sanitizedName

/-- Emit, compile (IREE; XLA compiles in-process) and load the four graphs. -/
def Net.load (spec : NetSpec) (B bf : Nat) (outShape : Nat → Array Nat) (pfx : String) : IO Net := do
  if let some e := MlirCodegen.vjpUnsupported spec then
    throw <| IO.userError s!"{spec.name}: {e}"
  let slug := spec.sanitizedName
  let graphs : List (String × String) := [
    ("eval_b", MlirCodegen.generateEval spec B),
    ("eval_f", MlirCodegen.generateEval spec bf),
    ("vjp", MlirCodegen.generateVjp spec B (moduleName := slug ++ "_vjp")),
    ("adam", MlirCodegen.generateApplyAdam spec (moduleName := slug ++ "_adam"))]
  let mut sess : Array LowererSession := #[]
  for (suffix, mlir) in graphs do
    let base := s!"{pfx}_{slug}"
    IO.FS.writeFile s!"{base}_{suffix}.mlir" mlir
    let art ← NetSpec.graphArtifact base suffix
    let (_, ok) ← NetSpec.runIreeCached s!"{base}_{suffix}.mlir" art mlir
    unless ok do throw <| IO.userError s!"compile failed: {base}_{suffix}.mlir"
    sess := sess.push (← LowererSession.create art)
  match sess with
  | #[evalB, evalF, vjpS, adamS] => return { spec, B, bf, outShape, evalB, evalF, vjpS, adamS }
  | _ => throw <| IO.userError "Net.load: expected four sessions"

/-- The eval forward on `rows ≤ batch` examples of `x` (`[rows, inDim]`), padded with zeros to
    the graph's batch; the output's first `rows` rows. -/
def Net.fwd (net : Net) (params x : ByteArray) (rows : Nat) (search : Bool) : IO ByteArray := do
  let batch := if search then net.bf else net.B
  let sess := if search then net.evalF else net.evalB
  if rows > batch then throw <| IO.userError s!"{net.spec.name}: {rows} rows > batch {batch}"
  let x := if rows < batch then x.extract 0 (rows * net.inDim * 4) ++
      ByteArray.mk (Array.replicate ((batch - rows) * net.inDim * 4) 0) else x
  let out ← LowererSession.forwardF32 sess net.spec.evalFnName params net.spec.evalShapesBA x
    (net.spec.xShape batch) batch.toUSize net.outDim.toUSize
  return out.extract 0 (rows * net.outDim * 4)

def countsBA (cs : List Nat) : ByteArray :=
  cs.foldl pushU32LE (pushU32LE .empty cs.length)

/-- `(θ, x, ḡ) ↦ (∂θ, ∂x)` at the training batch, batch-summed. -/
def Net.vjp (net : Net) (params x gbar : ByteArray) : IO (ByteArray × ByteArray) := do
  let B := net.B
  let shapes := packShapes (net.spec.paramShapes ++ #[#[B, net.inDim], net.outShape B])
  let outs := countsBA ((net.spec.paramShapes.toList.map fun s => s.foldl (· * ·) 1) ++ [B * net.inDim])
  let res ← LowererSession.invokeF32 net.vjpS (net.slug ++ "_vjp.main") (params ++ x ++ gbar) shapes outs
  return (res.extract 0 (net.nP * 4), res.extract (net.nP * 4) res.size)

/-- One Adam step on the gradient `d` at step `t`. -/
def Net.adam (net : Net) (p m v d : ByteArray) (lr t : Float) : IO (ByteArray × ByteArray × ByteArray) := do
  let ps := net.spec.paramShapes
  let shapes := packShapes (ps ++ ps ++ ps ++ ps ++ #[#[], #[]])
  let sizes := ps.toList.map fun s => s.foldl (· * ·) 1
  let outs := countsBA (sizes ++ sizes ++ sizes)
  let res ← LowererSession.invokeF32 net.adamS (net.slug ++ "_adam.main")
    (p ++ m ++ v ++ d ++ pushF32LE (pushF32LE .empty lr) t) shapes outs
  return F32.unpackAdam res net.nP

-- ── The model and the search ──

/-- The four nets and what the search needs. -/
structure Model where
  n : Nat
  C : Nat
  bf : Nat
  h : Net
  g : Net
  f : Net
  r : Net
  cpuct : Float
  alpha : Float
  eps : Float
  arena : ByteArray

def Model.nc (M : Model) : Nat := M.n * M.n
def Model.nOut (M : Model) : Nat := M.n * M.n + 1
def Model.D (M : Model) : Nat := M.C * M.n * M.n

/-- The four parameter blobs. -/
structure Params where
  h : ByteArray
  g : ByteArray
  f : ByteArray
  r : ByteArray

def Params.blob (P : Params) : ByteArray := P.h ++ P.g ++ P.f ++ P.r

def uniform (g : StdGen) : Float × StdGen :=
  let (u, g) := randNat g 0 999999999
  ((u.toFloat + 0.5) / 1.0e9, g)

def sampleFrom (p : Array Float) (g : StdGen) : Nat × StdGen := Id.run do
  let (u, g) := uniform g
  let mut acc := 0.0
  let mut last := 0
  for i in [0:p.size] do
    if p[i]! > 0.0 then
      last := i
      acc := acc + p[i]!
      if u < acc then return (i, g)
  return (last, g)

def seed64 (g : StdGen) : UInt64 × StdGen :=
  let (a, g) := randNat g 0 0xFFFFFFFF
  let (b, g) := randNat g 0 0xFFFFFFFF
  ((a.toUInt64 <<< 32) ||| b.toUInt64, g)

def argmaxLegal (score : Nat → Float) (pos : Pos) : Nat := Id.run do
  let mut best := 0
  let mut bestS := -1.0e30
  for c in pos.legal do
    if score c > bestS then
      bestS := score c
      best := c
  return best

def Pos.ofIndex (n k idx : Nat) : Pos := Id.run do
  let mut p := Pos.empty n k
  let mut i := idx
  for c in [0:n * n] do
    let d := (i % 3).toUInt8
    if d != 0 then p := { p with cells := p.cells.set! c d, stones := p.stones + 1 }
    i := i / 3
  return p

def legalMask (p : Pos) : ByteArray :=
  ByteArray.mk (p.cells.map fun c => if c == 0 then 1 else 0)

def idxBA (ps : Array Pos) : ByteArray := ps.foldl (fun acc p => pushU64LE acc p.index) .empty

/-- `h` then min–max over `rows ≤ bf` positions (u64 indices): the latents `[rows, D]`. -/
def represent (M : Model) (P : Params) (idx : ByteArray) (rows : Nat) : IO ByteArray := do
  let x ← planesOf idx rows.toUSize M.n.toUSize
  let s ← M.h.fwd P.h x rows true
  minmax s rows.toUSize M.D.toUSize

/-- `rows` searches at once from `roots` (the live games' positions), `sims` simulations
    each (the roots' own evaluation is the first). -/
def search (M : Model) (P : Params) (roots : Array Pos) (sims : Nat) (noise : Bool) (g0 : StdGen) :
    IO StdGen := do
  let G := M.bf
  let rows := roots.size
  let live := ByteArray.mk ((Array.range G).map fun i => if i < rows then 1 else 0)
  let lat ← represent M P (idxBA roots) rows
  let logits ← M.f.fwd P.f lat rows true
  let masks := roots.foldl (fun acc p => acc ++ legalMask p) .empty
  let (sd, g) := seed64 g0
  muzRoots M.arena live lat logits M.nOut.toUSize masks .empty (if noise then 1 else 0) M.alpha M.eps sd
  for _ in [1:sims] do
    let sel ← muzSelect M.arena live M.cpuct 1
    let mut nPend := 0
    for i in [0:G] do
      if readU32LE sel (24 * i) == 1 then nPend := nPend + 1
    if nPend == 0 then
      muzExpandBackup M.arena .empty .empty M.nOut.toUSize .empty 1 .empty .empty .empty
    else
      let gin ← muzGather M.arena
      let sRaw ← M.g.fwd P.g gin nPend true
      let s ← minmax sRaw nPend.toUSize M.D.toUSize
      let lo ← M.f.fwd P.f s nPend true
      let ro ← M.r.fwd P.r s nPend true
      muzExpandBackup M.arena s lo M.nOut.toUSize ro 1 .empty .empty .empty
  return g

def visitDists (M : Model) (rows : Nat) : IO (Array (Array Float)) := do
  let v ← muzRootVisits M.arena
  return (Array.range rows).map fun i => (Array.range M.nc).map fun c => F32.read v (i * M.nc + c).toUSize

-- ── Self-play and the replay ──

/-- One game: the positions it stood at (index), the moves, the search's visit
    distributions, and its result from X's view. -/
structure Game where
  idx : Array Nat
  acts : Array Nat
  pis : Array (Array Float)
  result : Int
deriving Inhabited

/-- `bf` games in lockstep with the latent search; sampled from the visit distribution for
    the first `tempPlies` plies, then greedy. -/
def selfPlay (M : Model) (P : Params) (root : Pos) (sims tempPlies : Nat) (g0 : StdGen) :
    IO (Array Game × StdGen) := do
  let G := M.bf
  let mut pos : Array Pos := Array.replicate G root
  let mut live : Array Bool := Array.replicate G true
  let mut games : Array Game := Array.replicate G { idx := #[], acts := #[], pis := #[], result := 0 }
  let mut g := g0
  let mut ply := 0
  while live.any id do
    let liveIx := (Array.range G).filter (live[·]!)
    g ← search M P (liveIx.map (pos[·]!)) sims true g
    let pis ← visitDists M liveIx.size
    for j in [0:liveIx.size] do
      let i := liveIx[j]!
      let p := pos[i]!
      let pi := pis[j]!
      let (a, g') := if ply < tempPlies then sampleFrom pi g else (argmaxLegal (fun c => pi[c]!) p, g)
      g := g'
      games := games.modify i fun gm => { gm with idx := gm.idx.push p.index, acts := gm.acts.push a, pis := gm.pis.push pi }
      let p' := p.play a
      pos := pos.set! i p'
      if p'.terminal then
        live := live.set! i false
        games := games.modify i ({ · with result := p'.result })
    ply := ply + 1
  return (games, g)

/-- One training batch: `B` positions from the window and the `K` moves after each, with
    §4's targets. Past the end of a game: a uniformly random move, a uniform policy target,
    value and reward 0. -/
structure Batch where
  obs : ByteArray                -- u64 [B] position indices
  acts : Array ByteArray         -- k = 1..K: u32 [B]
  pis : Array ByteArray          -- k = 0..K: f32 [B, n²]
  zs : Array ByteArray           -- k = 0..K: f32 [B]
  us : Array ByteArray           -- k = 1..K: f32 [B] (index k − 1)
  wf : Array ByteArray           -- k = 0..K: f32 [B] per-sample weights
  wr : ByteArray                 -- f32 [B], the reward terms' weight

def sampleBatch (games : Array Game) (B K nc : Nat) (g0 : StdGen) : Batch × StdGen := Id.run do
  let total := games.foldl (· + ·.idx.size) 0
  let mut g := g0
  let mut obs := ByteArray.empty
  let mut acts := Array.replicate K ByteArray.empty
  let mut pis := Array.replicate (K + 1) ByteArray.empty
  let mut zs := Array.replicate (K + 1) ByteArray.empty
  let mut us := Array.replicate K ByteArray.empty
  let w0 := 1.0 / B.toFloat
  let wk := 1.0 / (B * K).toFloat
  for _ in [0:B] do
    let (j0, g') := randNat g 0 (total - 1)
    g := g'
    -- the j0-th position of the window
    let mut j := j0
    let mut gi := 0
    while j >= games[gi]!.idx.size do
      j := j - games[gi]!.idx.size
      gi := gi + 1
    let gm := games[gi]!
    let T := gm.idx.size
    obs := pushU64LE obs gm.idx[j]!
    for k in [0:K + 1] do
      let t := j + k
      if t < T then
        for c in [0:nc] do pis := pis.modify k (pushF32LE · gm.pis[t]![c]!)
        -- the mover at ply t is X on even plies of the game
        let z := if t % 2 == 0 then gm.result else -gm.result
        zs := zs.modify k (pushF32LE · (Float.ofInt z))
      else
        for _ in [0:nc] do pis := pis.modify k (pushF32LE · (1.0 / nc.toFloat))
        zs := zs.modify k (pushF32LE · 0.0)
      if k ≥ 1 then
        let t1 := t - 1
        let (a, g') := if t1 < T then (gm.acts[t1]!, g) else randNat g 0 (nc - 1)
        g := g'
        acts := acts.modify (k - 1) (pushU32LE · a)
        let u := if t1 + 1 == T && gm.result != 0 then 1.0 else 0.0
        us := us.modify (k - 1) (pushF32LE · u)
  let wfill (w : Float) : ByteArray := (List.range B).foldl (fun acc _ => pushF32LE acc w) .empty
  let wf := (Array.range (K + 1)).map fun k => wfill (if k == 0 then w0 else wk)
  return ({ obs, acts, pis, zs, us, wf, wr := wfill wk }, g)

/-- The unrolled loss's four parameter gradients on one batch, and its terms
    `[value, policy, reward]` (batch means, the 1/K weights in). -/
def unrollGrad (M : Model) (P : Params) (b : Batch) (K B : Nat) :
    IO (Params × Array Float × Nat) := do
  let nc := M.nc
  let D := M.D
  let x0 ← planesOf b.obs B.toUSize M.n.toUSize
  let mut sRaw : Array ByteArray := #[← M.h.fwd P.h x0 B false]
  let mut s : Array ByteArray := #[← minmax sRaw[0]! B.toUSize D.toUSize]
  let mut gin : Array ByteArray := #[ByteArray.empty]
  let mut clamped := (← minmaxClamped sRaw[0]! B.toUSize D.toUSize).toNat
  for k in [1:K + 1] do
    let gi ← withAction s[k - 1]! b.acts[k - 1]! B.toUSize M.C.toUSize nc.toUSize
    gin := gin.push gi
    let sr ← M.g.fwd P.g gi B false
    clamped := clamped + (← minmaxClamped sr B.toUSize D.toUSize).toNat
    sRaw := sRaw.push sr
    s := s.push (← minmax sr B.toUSize D.toUSize)
  let mut lv := 0.0
  let mut lp := 0.0
  let mut lr := 0.0
  let mut gf : Array ByteArray := #[]
  let mut gr : Array ByteArray := #[ByteArray.empty]
  for k in [0:K + 1] do
    let fo ← M.f.fwd P.f s[k]! B false
    let (gk, l) ← headsGrad fo b.pis[k]! b.zs[k]! b.wf[k]! B.toUSize M.nOut.toUSize nc.toUSize
    gf := gf.push gk
    lv := lv + F32.read l 0
    lp := lp + F32.read l 1
    if k ≥ 1 then
      let ro ← M.r.fwd P.r s[k]! B false
      let (gk, l) ← headsGrad ro .empty b.us[k - 1]! b.wr B.toUSize 1 0
      gr := gr.push gk
      lr := lr + F32.read l 0
  let mut dh ← F32.const M.h.nP.toUSize 0.0
  let mut dg ← F32.const M.g.nP.toUSize 0.0
  let mut df ← F32.const M.f.nP.toUSize 0.0
  let mut dr ← F32.const M.r.nP.toUSize 0.0
  let mut dsNext ← F32.const (B * D).toUSize 0.0
  let mut k := K
  while true do
    let (dθ, ds) ← M.f.vjp P.f s[k]! gf[k]!
    df ← F32.axpySlice df 0 dθ 0 M.f.nP.toUSize 1.0
    let mut dsk ← F32.axpySlice ds 0 dsNext 0 (B * D).toUSize 1.0
    if k ≥ 1 then
      let (dθ, ds) ← M.r.vjp P.r s[k]! gr[k]!
      dr ← F32.axpySlice dr 0 dθ 0 M.r.nP.toUSize 1.0
      dsk ← F32.axpySlice dsk 0 ds 0 (B * D).toUSize 1.0
    let dsRaw ← minmaxBack sRaw[k]! dsk B.toUSize D.toUSize
    if k == 0 then
      let (dθ, _) ← M.h.vjp P.h x0 dsRaw
      dh := dθ
      break
    let (dθ, dgin) ← M.g.vjp P.g gin[k]! dsRaw
    dg ← F32.axpySlice dg 0 dθ 0 M.g.nP.toUSize 1.0
    dsNext ← latentGrad dgin B.toUSize M.C.toUSize nc.toUSize 0.5
    k := k - 1
  return ({ h := dh, g := dg, f := df, r := dr }, #[lv, lp, lr], clamped)

-- ── The instrument: f ∘ h over every decision position, matches against perfect play ──

/-- f ∘ h on `count` positions (u64 indices) in chunks of `bf`: logits `[count, n² + 1]`. -/
def rootLogits (M : Model) (P : Params) (idx : ByteArray) (count : Nat) : IO ByteArray := do
  let mut out := ByteArray.empty
  let mut off := 0
  while off < count do
    let m := min M.bf (count - off)
    let lat ← represent M P (idx.extract (8 * off) (8 * (off + m))) m
    out := out ++ (← M.f.fwd P.f lat m true)
    off := off + m
  return out

/-- Policy agreement with the optimal set, value MSE and sign agreement over `count`
    positions: AlphaZero's sweep on f ∘ h. -/
def sweep (M : Model) (P : Params) (t : Table) (idx : ByteArray) (count : Nat) :
    IO (Float × Float × Float) := do
  let logits ← rootLogits M P idx count
  let r ← t.score idx count logits M.nOut
  let c := count.toFloat
  return (F32.read r 0 / c, F32.read r 1 / c, F32.read r 2 / c)

/-- `bf` games with the model on one side against the perfect player. `sims = 0` is the net
    alone (argmax of f ∘ h over the legal cells). W/D/L from the model's view. -/
def matchVsPerfect (M : Model) (P : Params) (t : Table) (root : Pos) (netIsX : Bool) (sims : Nat)
    (g0 : StdGen) : IO (WDL × StdGen) := do
  let G := M.bf
  let mut pos : Array Pos := Array.replicate G root
  let mut live : Array Bool := Array.replicate G true
  let mut res : WDL := {}
  let mut g := g0
  let perfect := perfectPlayer t
  let mut ply := 0
  while live.any id do
    let liveIx := (Array.range G).filter (live[·]!)
    let mut moves : Array Nat := Array.replicate G 0
    if (ply % 2 == 0) == netIsX then
      let ps := liveIx.map (pos[·]!)
      if sims == 0 then
        let logits ← rootLogits M P (idxBA ps) ps.size
        for j in [0:liveIx.size] do
          moves := moves.set! liveIx[j]! (argmaxLegal (fun c => F32.read logits (j * M.nOut + c).toUSize) ps[j]!)
      else
        g ← search M P ps sims false g
        let pis ← visitDists M ps.size
        for j in [0:liveIx.size] do
          moves := moves.set! liveIx[j]! (argmaxLegal (fun c => pis[j]![c]!) ps[j]!)
    else
      for i in liveIx do
        let (a, g') := perfect pos[i]! g
        g := g'
        moves := moves.set! i a
    for i in liveIx do
      let p' := pos[i]!.play moves[i]!
      pos := pos.set! i p'
      if p'.terminal then
        live := live.set! i false
        res := res.add (if netIsX then p'.result else -p'.result)
    ply := ply + 1
  return (res, g)

-- ── The oracle gate (§5) ──

/-- The latent search with the true dynamics against `lean_mcts_*` on one AlphaZero net, at
    every position of `idx`: the root visit distributions, compared exactly. Both searches
    read the net through the same two graphs (trunk, then head), so they see the same
    floats. Returns (positions, exactly equal, max L1 distance). -/
def oracleGate (n k bf sims : Nat) (cpuct : Float) (hS fS : Net) (pH pF : ByteArray)
    (idx : ByteArray) (count : Nat) : IO (Nat × Nat × Float) := do
  let nc := n * n
  let nOut := nc + 1
  let fwd (ix : ByteArray) (rows : Nat) : IO (ByteArray × ByteArray) := do
    let lat ← hS.fwd pH (← planesOf ix rows.toUSize n.toUSize) rows true
    return (lat, ← fS.fwd pF lat rows true)
  let mz ← muzAlloc bf.toUSize n.toUSize 64 (sims + 1).toUSize
  let az ← mctsAlloc bf.toUSize n.toUSize k.toUSize (nc * sims + 16).toUSize
  let mut equal := 0
  let mut maxL1 := 0.0
  let mut off := 0
  while off < count do
    let m := min bf (count - off)
    let ix := idx.extract (8 * off) (8 * (off + m))
    let roots := (Array.range m).map fun i => Pos.ofIndex n k (readU64 ix i)
    let live := ByteArray.mk ((Array.range bf).map fun i => if i < m then 1 else 0)
    -- the position-keyed search
    mctsReset az
    let rootsBA := ix ++ ByteArray.mk (Array.replicate (8 * (bf - m)) 0)
    for _ in [0:sims] do
      let sel ← mctsSelect az rootsBA live cpuct
      let mut pend := ByteArray.empty
      let mut nPend := 0
      for i in [0:bf] do
        if readU32LE sel (16 * i) == 1 then
          pend := pushU64LE pend (readU64 sel (2 * i + 1))
          nPend := nPend + 1
      let logits ← if nPend == 0 then pure ByteArray.empty else (·.2) <$> fwd pend nPend
      mctsExpandBackup az logits nOut.toUSize 0 0.0 0.0 1
    let vA ← mctsRootVisits az rootsBA
    -- the latent search, its dynamics the rules
    let (lat, logits) ← fwd ix m
    let masks := roots.foldl (fun acc p => acc ++ legalMask p) .empty
    muzRoots mz live lat logits nOut.toUSize masks ix 0 0.0 0.0 1
    for _ in [1:sims] do
      let sel ← muzSelect mz live cpuct 0
      let mut nxt : Array Pos := #[]
      let mut keys := ByteArray.empty
      let mut rew := ByteArray.empty
      let mut term := ByteArray.empty
      let mut msk := ByteArray.empty
      for i in [0:bf] do
        if readU32LE sel (24 * i) == 1 then
          let p := Pos.ofIndex n k (readU64LE sel (24 * i + 16))
          let p' := p.play (readU32LE sel (24 * i + 8))
          nxt := nxt.push p'
          keys := pushU64LE keys p'.index
          rew := pushF32LE rew (if p'.terminal && p'.result != 0 then 1.0 else 0.0)
          term := term.push (if p'.terminal then 1 else 0)
          msk := msk ++ legalMask p'
      if nxt.isEmpty then
        muzExpandBackup mz .empty .empty nOut.toUSize .empty 0 .empty .empty .empty
      else
        let (l2, o2) ← fwd (idxBA nxt) nxt.size
        muzExpandBackup mz l2 o2 nOut.toUSize rew 0 msk term keys
    let vB ← muzRootVisits mz
    for i in [0:m] do
      let mut l1 := 0.0
      for c in [0:nc] do
        l1 := l1 + (F32.read vA (i * nc + c).toUSize - F32.read vB (i * nc + c).toUSize).abs
      if l1 == 0.0 then equal := equal + 1
      maxL1 := max maxL1 l1
    off := off + m
  return (count, equal, maxL1)

end MuZeroTtt

open MuZeroTtt in
def main (args : List String) : IO Unit := do
  let kv := CliArgs.kv args
  let natArg := CliArgs.natArg args
  let floatArg := CliArgs.floatArg args
  let mode := (kv "mode").getD "train"
  let n := natArg "n" 3
  let k := natArg "k" n
  let C := natArg "C" 32
  let K := natArg "K" 5
  let iters := natArg "iters" 20
  let sims := natArg "sims" 25
  let bf := natArg "bf" 256
  let B := natArg "batch" 64
  let epochs := natArg "epochs" 10
  let lr := floatArg "lr" 1.0e-3
  let window := natArg "window" 20
  let cpuct := floatArg "cpuct" 1.25
  let alpha := floatArg "alpha" 1.0
  let eps := floatArg "noise" 0.25
  let tempPlies := natArg "tempPlies" (n * n)
  let seed := natArg "seed" 1
  let tag := kv "tag"
  let nc := n * n
  let nOut := nc + 1
  unless n ≤ 4 do throw <| IO.userError "muzero-ttt: n ≤ 4 (the dense table)"
  let backend ← LowererSession.backendName
  let t0 ← IO.monoMsNow
  IO.FS.createDirAll ".lake/build"
  let pfx := s!".lake/build/muzero_ttt_{n}x{n}" ++ (match tag with | some t => "_" ++ t | none => "")
  let table ← Table.build n k
  let root := Pos.empty n k
  let decIdx ← reachableIdx table.tbl n.toUSize 0
  let nDec := decIdx.size / 8

  if mode == "oracle" then
    -- §5: the latent search with the true dynamics against the position-keyed search
    let hS ← Net.load (azH n) bf bf (fun b => #[b, 64, n, n]) pfx
    let fS ← Net.load (azF n) bf bf (fun b => #[b, nOut]) pfx
    let az : NetSpec := { name := s!"alphazero ttt {n}x{n}", imageH := n, imageW := n,
                          layers := (azH n).layers ++ (azF n).layers }
    let p ← match kv "azParams" with
      | some f => IO.FS.readBinFile f
      | none => az.heInitParams (seed.toUSize)
    unless p.size == az.totalParams * 4 do
      throw <| IO.userError s!"azParams: {p.size} bytes, expected {az.totalParams * 4}"
    let pH := p.extract 0 ((azH n).totalParams * 4)
    let pF := p.extract ((azH n).totalParams * 4) p.size
    IO.eprintln s!"oracle gate ({backend}): AlphaZero {n}x{n} net \
{if (kv "azParams").isSome then "trained" else "at its init"}, {nDec} decision positions, cpuct {cpuct}"
    let mut ok := true
    let simsList := ((kv "oracleSims").getD s!"2,3,4,5,6,{sims}").splitOn "," |>.filterMap String.toNat?
    for s in simsList do
      let (cnt, eq, l1) ← oracleGate n k bf s cpuct hS fS pH pF decIdx nDec
      let exact := s ≤ 6
      IO.eprintln s!"  sims {s}: {eq} / {cnt} root visit distributions equal, max L1 {fmt l1 6}\
{if exact then (if eq == cnt then "  ✓ exact" else "  ✗ MUST be exact (no transposition before 7 simulations)") else "  (transpositions share nodes in lean_mcts)"}"
      if exact && eq != cnt then ok := false
    unless ok do throw <| IO.userError "oracle gate FAILED"
    IO.eprintln s!"oracle gate passed ({(← IO.monoMsNow) - t0} ms)"
    return

  let hN ← Net.load (hNet n C) B bf (fun b => #[b, C, n, n]) pfx
  let gN ← Net.load (gNet n C) B bf (fun b => #[b, C, n, n]) pfx
  let fN ← Net.load (fNet n C) B bf (fun b => #[b, nOut]) pfx
  let rN ← Net.load (rNet n C) B bf (fun b => #[b, 1]) pfx
  let nets := [hN, gN, fN, rN]
  let nP := nets.foldl (· + ·.nP) 0
  IO.eprintln s!"muzero ttt {n}x{n} ({backend}): h {hN.nP} + g {gN.nP} + f {fN.nP} + r {rN.nP} = {nP} params, \
C {C}, K {K}, {iters} iterations of {bf} games at {sims} sims, batch {B} × {epochs} epochs over the last \
{window} iterations, lr {lr}, cpuct {cpuct}, Dir({alpha}) at {eps}, seed {seed} \
(graphs {(← IO.monoMsNow) - t0} ms)"
  let mut P : Params ← match kv "params" with
    | some f => do
      let b ← IO.FS.readBinFile f
      unless b.size == nP * 4 do throw <| IO.userError s!"{f}: {b.size} bytes, expected {nP * 4}"
      let o1 := hN.nP * 4
      let o2 := o1 + gN.nP * 4
      let o3 := o2 + fN.nP * 4
      pure { h := b.extract 0 o1, g := b.extract o1 o2, f := b.extract o2 o3, r := b.extract o3 b.size }
    | none => pure { h := ← hN.spec.heInitParams 11, g := ← gN.spec.heInitParams 12,
                     f := ← fN.spec.heInitParams 13, r := ← rN.spec.heInitParams 14 }
  let arena ← muzAlloc bf.toUSize n.toUSize C.toUSize (sims + 1).toUSize
  let M : Model := { n, C, bf, h := hN, g := gN, f := fN, r := rN, cpuct, alpha, eps, arena }
  -- shape checks before anything trains (§11): every graph's output size, the action plane
  let D := M.D
  let probe ← represent M P (pushU64LE .empty 0) 1
  unless probe.size == D * 4 do throw <| IO.userError s!"h returned {probe.size} bytes, expected {D * 4}"
  for (net, p, inD, outD) in [(hN, P.h, 2 * nc, D), (gN, P.g, D + nc, D), (fN, P.f, D, nOut), (rN, P.r, D, 1)] do
    unless net.inDim == inD && net.outDim == outD do
      throw <| IO.userError s!"{net.spec.name}: in {net.inDim} out {net.outDim}, expected {inD} → {outD}"
    let x ← F32.const (B * inD).toUSize 0.5
    let o ← net.fwd p x B false
    let (dθ, dx) ← net.vjp p x (← F32.const (B * outD).toUSize 1.0)
    unless o.size == B * outD * 4 && dθ.size == net.nP * 4 && dx.size == B * inD * 4 do
      throw <| IO.userError s!"{net.spec.name}: eval / VJP output sizes {o.size} {dθ.size} {dx.size}"
  let g0 ← withAction probe (pushU32LE .empty 0) 1 C.toUSize nc.toUSize
  unless g0.size == (D + nc) * 4 do throw <| IO.userError "the action-plane concat has the wrong size"
  IO.eprintln "  shape checks passed"

  let mut g := mkStdGen seed
  if mode == "dump" then
    -- one batch of self-play at the initial parameters, one batch's gradients, for the JAX gate
    let (games, g1) ← selfPlay M P root sims tempPlies g
    let (b, _) := sampleBatch games B K nc g1
    let (dP, l, cl) ← unrollGrad M P b K B
    let dir := ".lake/build/muz_unroll"
    IO.FS.createDirAll dir
    let cat (xs : Array ByteArray) : ByteArray := xs.foldl (· ++ ·) .empty
    IO.FS.writeBinFile s!"{dir}/params.bin" P.blob
    IO.FS.writeBinFile s!"{dir}/grads.bin" dP.blob
    IO.FS.writeBinFile s!"{dir}/x0.bin" (← planesOf b.obs B.toUSize n.toUSize)
    IO.FS.writeBinFile s!"{dir}/acts.bin" (cat b.acts)
    IO.FS.writeBinFile s!"{dir}/pis.bin" (cat b.pis)
    IO.FS.writeBinFile s!"{dir}/zs.bin" (cat b.zs)
    IO.FS.writeBinFile s!"{dir}/us.bin" (cat b.us)
    let specJson (s : NetSpec) : String :=
      let ls := s.layers.map fun
        | .conv2d ic oc kk _ a => s!"\{\"kind\": \"conv2d\", \"ic\": {ic}, \"oc\": {oc}, \"k\": {kk}, \"act\": \"{if a == .relu then "relu" else "identity"}\"}"
        | .dense fi fo a => s!"\{\"kind\": \"dense\", \"fi\": {fi}, \"fo\": {fo}, \"act\": \"{if a == .relu then "relu" else "identity"}\"}"
        | .flatten => "{\"kind\": \"flatten\"}"
        | _ => "{\"kind\": \"unsupported\"}"
      s!"\{\"name\": \"{s.name}\", \"nP\": {s.totalParams}, \"layers\": [{", ".intercalate ls}]}"
    IO.FS.writeFile s!"{dir}/meta.json" s!"\{\"n\": {n}, \"C\": {C}, \"K\": {K}, \"B\": {B}, \
\"loss\": [{l[0]!}, {l[1]!}, {l[2]!}], \"nets\": [{", ".intercalate (nets.map (specJson ·.spec))}]}\n"
    IO.eprintln s!"dumped one batch to {dir}: loss value {fmt l[0]! 5} policy {fmt l[1]! 5} reward \
{fmt l[2]! 5}, {cl} clamped latents"
    return

  let instrument (P : Params) (iter : Nat) (g : StdGen) : IO (String × StdGen) := do
    let (agree, mse, sign) ← sweep M P table decIdx nDec
    let (aX, g) ← matchVsPerfect M P table root true 0 g
    let (aO, g) ← matchVsPerfect M P table root false 0 g
    let (mX, g) ← matchVsPerfect M P table root true sims g
    let (mO, g) ← matchVsPerfect M P table root false sims g
    IO.eprintln s!"  iter {iter}: f∘h sweep agree {fmt (100.0 * agree) 2}% value mse {fmt mse 4} \
sign {fmt (100.0 * sign) 2}%  net alone vs perfect X {aX.str} O {aO.str}  +search X {mX.str} O {mO.str}"
    return (s!"{fmt agree 4},{fmt mse 4},{fmt sign 4},{aX.w},{aX.d},{aX.l},{aO.w},{aO.d},{aO.l},\
{mX.w},{mX.d},{mX.l},{mO.w},{mO.d},{mO.l}", g)

  let mut curve := "iter,samples,steps,loss_value,loss_policy,loss_reward,clamped,agree,value_mse,sign_agree,\
alone_x_w,alone_x_d,alone_x_l,alone_o_w,alone_o_d,alone_o_l,search_x_w,search_x_d,search_x_l,\
search_o_w,search_o_d,search_o_l,seen,ms\n"
  let (row0, g1) ← instrument P 0 g
  g := g1
  curve := curve ++ s!"0,0,0,,,,,{row0},0,{(← IO.monoMsNow) - t0}\n"
  let mut pool : Array (Array Game) := #[]
  let mut mh ← F32.const hN.nP.toUSize 0.0
  let mut vh ← F32.const hN.nP.toUSize 0.0
  let mut mg ← F32.const gN.nP.toUSize 0.0
  let mut vg ← F32.const gN.nP.toUSize 0.0
  let mut mf ← F32.const fN.nP.toUSize 0.0
  let mut vf ← F32.const fN.nP.toUSize 0.0
  let mut mr ← F32.const rN.nP.toUSize 0.0
  let mut vr ← F32.const rN.nP.toUSize 0.0
  let mut steps := 0
  let mut seen : Std.HashSet Nat := {}
  for iter in [1:iters + 1] do
    let tI ← IO.monoMsNow
    let (games, g1) ← selfPlay M P root sims tempPlies g
    g := g1
    for gm in games do
      for ix in gm.idx do seen := seen.insert ix
    pool := pool.push games
    if pool.size > window then pool := pool.extract 1 pool.size
    let xWins := games.foldl (fun a gm => if gm.result > 0 then a + 1 else a) 0
    let oWins := games.foldl (fun a gm => if gm.result < 0 then a + 1 else a) 0
    let tS ← IO.monoMsNow
    let all := pool.flatten
    let N := all.foldl (· + ·.idx.size) 0
    let nSteps := epochs * N / B
    let mut lAcc := #[0.0, 0.0, 0.0]
    let mut clAcc := 0
    for _ in [0:nSteps] do
      let (b, g') := sampleBatch all B K nc g
      g := g'
      let (dP, l, cl) ← unrollGrad M P b K B
      steps := steps + 1
      let t := steps.toFloat
      let (ph, mh', vh') ← hN.adam P.h mh vh dP.h lr t
      let (pg, mg', vg') ← gN.adam P.g mg vg dP.g lr t
      let (pf, mf', vf') ← fN.adam P.f mf vf dP.f lr t
      let (pr, mr', vr') ← rN.adam P.r mr vr dP.r lr t
      P := { h := ph, g := pg, f := pf, r := pr }
      mh := mh'; vh := vh'; mg := mg'; vg := vg'; mf := mf'; vf := vf'; mr := mr'; vr := vr'
      lAcc := (Array.range 3).map fun i => lAcc[i]! + l[i]!
      clAcc := clAcc + cl
    let ns := (max 1 nSteps).toFloat
    -- §11: a collapsed latent stops the run rather than training on constants
    if nSteps > 0 && clAcc * 2 > nSteps * B * (K + 1) then
      throw <| IO.userError s!"iter {iter}: {clAcc} of {nSteps * B * (K + 1)} latents clamped — the latent collapsed"
    let tE ← IO.monoMsNow
    let (row, g2) ← instrument P iter g
    g := g2
    let tF ← IO.monoMsNow
    IO.eprintln s!"    self-play {games.foldl (· + ·.idx.size) 0} positions (X {xWins} / draw \
{bf - xWins - oWins} / O {oWins}), {nSteps} steps over {N} samples, loss value {fmt (lAcc[0]! / ns) 4} \
policy {fmt (lAcc[1]! / ns) 4} reward {fmt (lAcc[2]! / ns) 4}, {clAcc} clamped latents  \
(play {tS - tI} train {tE - tS} score {tF - tE} ms)"
    curve := curve ++ s!"{iter},{N},{steps},{fmt (lAcc[0]! / ns) 4},{fmt (lAcc[1]! / ns) 4},\
{fmt (lAcc[2]! / ns) 4},{clAcc},{row},{seen.size},{tF - t0}\n"
    IO.FS.writeFile s!"{pfx}_curve.csv" curve
    IO.FS.writeBinFile s!"{pfx}_params.bin" P.blob
  IO.eprintln s!"trained: {iters} iterations, {steps} steps, {(← IO.monoMsNow) - t0} ms; \
self-play stood at {seen.size} of the {nDec} decision positions"
  IO.eprintln s!"wrote {pfx}_curve.csv, {pfx}_params.bin"
