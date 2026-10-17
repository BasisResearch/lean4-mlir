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

    `mode=score params=<prefix>_params.bin` is §6's instrument on a saved model (the visited set
    read from `<prefix>_seen.bin`): M1 matches against perfect and random play, net alone and
    with search; M2 f ∘ h over every decision position; M3 f after k imagined moves along the
    agent's own, perfect and random legal lines, against the true position each reaches; M4a
    r against the true winning moves (every legal move from every position, and along the
    lines); M4b how often the imagined policy's argmax and the search's principal line play a
    taken cell; M4c the two move orders a b c / c b a to one board; M4d a ridge probe from the
    latent to the cells, fit on h of half the decision positions. Every number split visited /
    unvisited (M5), all of them written to `<prefix>_score.csv`.

    `lake exe muzero-ttt [mode=train|oracle|dump|score] [n=3] [k=n] [C=32] [K=5] [iters=20]
     [sims=25] [bf=256] [batch=64] [epochs=10] [steps=0] [lr=1e-3] [window=20] [cpuct=1.25]
     [alpha=1.0] [noise=0.25] [tempPlies=n²] [aug=1] [qnorm=1] [seed=1] [tag=<name>] [params=<file>]
     [azParams=<file>] [oracleSims=2,3,4,5,6,<sims>] [lines=2K] [probeLambda=1]`;
    writes `<prefix>_curve.csv`, `<prefix>_params.bin` (h, g, f, r back to back) and
    `<prefix>_seen.bin` (the decision positions self-play stood at, u64) under
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
  /-- PUCT's Q over the tree's min–max range (the paper's; an unvisited child scores the
      range's bottom), or the raw mean with an unvisited child at 0 (AlphaZero's). -/
  qnorm : Bool := true

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
    let sel ← muzSelect M.arena live M.cpuct (if M.qnorm then 1 else 0)
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
    value and reward 0. With `aug`, each sample is seen in one of the board's eight dihedral
    views, drawn per sample and held over its unroll. -/
structure Batch where
  obs : ByteArray                -- u64 [B] position indices
  acts : Array ByteArray         -- k = 1..K: u32 [B]
  pis : Array ByteArray          -- k = 0..K: f32 [B, n²]
  zs : Array ByteArray           -- k = 0..K: f32 [B]
  us : Array ByteArray           -- k = 1..K: f32 [B] (index k − 1)
  wf : Array ByteArray           -- k = 0..K: f32 [B] per-sample weights
  wr : ByteArray                 -- f32 [B], the reward terms' weight

/-- The cell map of dihedral view `d` (0–7) of the n×n board: `d % 4` quarter turns, then a
    mirror when `d ≥ 4`. -/
def dihedral (n d : Nat) : Array Nat := (Array.range (n * n)).map fun c => Id.run do
  let mut r := c / n
  let mut q := c % n
  for _ in [0:d % 4] do
    (r, q) := (q, n - 1 - r)
  if d ≥ 4 then q := n - 1 - q
  return r * n + q

/-- A position index under a cell map. -/
def permIndex (perm : Array Nat) (idx : Nat) : Nat := Id.run do
  let mut out := 0
  let mut i := idx
  for c in [0:perm.size] do
    out := out + (i % 3) * 3 ^ perm[c]!
    i := i / 3
  return out

def sampleBatch (games : Array Game) (B K nc : Nat) (g0 : StdGen) (aug : Bool := true) :
    Batch × StdGen := Id.run do
  let n := nc.sqrt
  let views := (Array.range 8).map (dihedral n)
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
    -- one dihedral view for the whole unroll: the board, every move and every π turn alike
    let (d, g') := if aug then randNat g 0 7 else (0, g)
    g := g'
    let perm := views[d]!
    let inv := (Array.range nc).foldl (fun acc c => acc.set! perm[c]! c) (Array.replicate nc 0)
    obs := pushU64LE obs (permIndex perm gm.idx[j]!)
    for k in [0:K + 1] do
      let t := j + k
      if t < T then
        for c in [0:nc] do pis := pis.modify k (pushF32LE · gm.pis[t]![inv[c]!]!)
        -- the mover at ply t is X on even plies of the game
        let z := if t % 2 == 0 then gm.result else -gm.result
        zs := zs.modify k (pushF32LE · (Float.ofInt z))
      else
        for _ in [0:nc] do pis := pis.modify k (pushF32LE · (1.0 / nc.toFloat))
        zs := zs.modify k (pushF32LE · 0.0)
      if k ≥ 1 then
        let t1 := t - 1
        let (a, g') := if t1 < T then (perm[gm.acts[t1]!]!, g) else randNat g 0 (nc - 1)
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

/-- `bf` games with the model on one side against `opp` (the perfect player, the random
    one). `sims = 0` is the net alone (argmax of f ∘ h over the legal cells). W/D/L from the
    model's view. -/
def matchVs (M : Model) (P : Params) (opp : Player) (root : Pos) (netIsX : Bool) (sims : Nat)
    (g0 : StdGen) : IO (WDL × StdGen) := do
  let G := M.bf
  let mut pos : Array Pos := Array.replicate G root
  let mut live : Array Bool := Array.replicate G true
  let mut res : WDL := {}
  let mut g := g0
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
        let (a, g') := opp pos[i]! g
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

-- ── The scorer (§6 M2–M5): the saved model against the solved game ──

@[extern "lean_muz_ridge"]
opaque ridge (x y : @& ByteArray) (N D M : USize) (lam : Float) : IO ByteArray

/-- Per row, the cells the probe `W` reads correctly (u32). -/
@[extern "lean_muz_probe_score"]
opaque probeScore (w lat truth : @& ByteArray) (rows D nc : USize) : IO ByteArray

/-- The cells from the mover's view, the probe's target: 0 empty, 1 the mover's, 2 the
    opponent's. -/
def moverCells (p : Pos) : ByteArray :=
  ByteArray.mk (p.cells.map fun c => if c == 0 then 0 else if c == p.mover then 1 else 2)

/-- f32 rows `rows` of a block of `w` floats a row. -/
def rowsOf (x : ByteArray) (w : Nat) (rows : Array Nat) : ByteArray :=
  rows.foldl (fun acc i => acc ++ x.extract (4 * w * i) (4 * w * (i + 1))) .empty

/-- `h`'s latents for `count` positions, in chunks of `bf`. -/
def representAll (M : Model) (P : Params) (idx : ByteArray) (count : Nat) : IO ByteArray := do
  let mut out := ByteArray.empty
  let mut off := 0
  while off < count do
    let m := min M.bf (count - off)
    out := out ++ (← represent M P (idx.extract (8 * off) (8 * (off + m))) m)
    off := off + m
  return out

/-- One more imagined move for `m` rows: `g` on the latent and the move, then min–max; and
    `r` on the result (pre-tanh). -/
def imagine (M : Model) (P : Params) (lat : ByteArray) (acts : Array Nat) (m : Nat) :
    IO (ByteArray × ByteArray) := do
  let a := acts.foldl pushU32LE .empty
  let gin ← withAction lat a m.toUSize M.C.toUSize M.nc.toUSize
  let s ← minmax (← M.g.fwd P.g gin m true) m.toUSize M.D.toUSize
  return (s, ← M.r.fwd P.r s m true)

/-- Legal lines of up to `L` moves from every start, ending early at a true terminal (the
    terminal move included): the agent's own net-alone policy on the TRUE positions, the
    perfect player, or uniform random legal moves. -/
def genLines (M : Model) (P : Params) (t : Table) (starts : Array Pos) (L : Nat) (src : String)
    (g0 : StdGen) : IO (Array (Array Nat) × StdGen) := do
  let mut lines : Array (Array Nat) := Array.replicate starts.size #[]
  let mut cur := starts
  let mut g := g0
  for _ in [0:L] do
    let live := (Array.range starts.size).filter (!cur[·]!.terminal)
    if live.isEmpty then break
    let mut moves : Array Nat := #[]
    if src == "own" then
      let ps := live.map (cur[·]!)
      let logits ← rootLogits M P (idxBA ps) ps.size
      moves := (Array.range ps.size).map fun j =>
        argmaxLegal (fun c => F32.read logits (j * M.nOut + c).toUSize) ps[j]!
    else
      for i in live do
        let (a, g') := (if src == "perfect" then perfectPlayer t else randomPlayer) cur[i]! g
        g := g'
        moves := moves.push a
    for j in [0:live.size] do
      let i := live[j]!
      lines := lines.modify i (·.push moves[j]!)
      cur := cur.set! i (cur[i]!.play moves[j]!)
  return (lines, g)

/-- Per (k, split) accumulators; split 1 = the position self-play stood at. -/
structure LineAcc where
  idx : Array ByteArray
  logits : Array ByteArray
  n : Array Nat
  occupied : Array Nat      -- the imagined policy's argmax over ALL cells on a taken cell
  probeCells : Array Nat
  probeBoards : Array Nat
  winN : Array Nat          -- reward: winning moves, and those r called (tanh r > ½)
  winHit : Array Nat
  restN : Array Nat         -- non-winning moves, and those r called wins
  restHit : Array Nat

def LineAcc.empty (slots : Nat) : LineAcc :=
  let z := Array.replicate slots 0
  { idx := Array.replicate slots .empty, logits := Array.replicate slots .empty, n := z,
    occupied := z, probeCells := z, probeBoards := z, winN := z, winHit := z, restN := z, restHit := z }

/-- M3 / M4a / M4b / M4d along lines: from each start, the imagined state after k moves —
    f's policy and value against the TRUE position the line reached, the probe's readout of
    it, and r on each move against whether it won. -/
def scoreLines (M : Model) (P : Params) (W : ByteArray) (seen : Std.HashSet Nat) (starts : Array Pos)
    (lines : Array (Array Nat)) (L : Nat) : IO LineAcc := do
  let nc := M.nc
  let mut acc := LineAcc.empty (2 * (L + 1))
  let mut off := 0
  while off < starts.size do
    let m := min M.bf (starts.size - off)
    let rows := (Array.range m).map (· + off)
    let mut pos := rows.map (starts[·]!)
    let mut lat ← represent M P (idxBA pos) m
    for k in [0:L + 1] do
      let fo ← M.f.fwd P.f lat m true
      let here := (Array.range m).filter fun i => lines[rows[i]!]!.size ≥ k && !pos[i]!.terminal
      let truth := here.foldl (fun a i => a ++ moverCells pos[i]!) .empty
      let pc ← probeScore W (rowsOf lat M.D here) truth here.size.toUSize M.D.toUSize nc.toUSize
      for j in [0:here.size] do
        let i := here[j]!
        let p := pos[i]!
        let sl := 2 * k + (if seen.contains p.index then 1 else 0)
        let row := fo.extract (4 * M.nOut * i) (4 * M.nOut * (i + 1))
        let mut best := 0
        for c in [0:nc] do
          if F32.read row c.toUSize > F32.read row best.toUSize then best := c
        let ok := readU32LE pc (4 * j)
        acc := { acc with
          idx := acc.idx.modify sl (pushU64LE · p.index),
          logits := acc.logits.modify sl (· ++ row),
          n := acc.n.modify sl (· + 1),
          occupied := acc.occupied.modify sl (· + (if p.cells[best]! != 0 then 1 else 0)),
          probeCells := acc.probeCells.modify sl (· + ok),
          probeBoards := acc.probeBoards.modify sl (· + (if ok == nc then 1 else 0)) }
      if k == L then break
      let acts := (Array.range m).map fun i => (lines[rows[i]!]!)[k]?.getD 0
      let (lat', ro) ← imagine M P lat acts m
      lat := lat'
      for i in [0:m] do
        if lines[rows[i]!]!.size > k then
          let p := pos[i]!
          let p' := p.play acts[i]!
          let won := p'.terminal && p'.result != 0
          let called := Float.tanh (F32.read ro i.toUSize) > 0.5
          let sl := 2 * (k + 1) + (if seen.contains p.index then 1 else 0)
          acc := if won then { acc with winN := acc.winN.modify sl (· + 1),
                                        winHit := acc.winHit.modify sl (· + (if called then 1 else 0)) }
                 else { acc with restN := acc.restN.modify sl (· + 1),
                                 restHit := acc.restHit.modify sl (· + (if called then 1 else 0)) }
          pos := pos.set! i p'
    off := off + m
  return acc

/-- The probe's targets as ridge outputs: per row, per cell, one-hot over the three states. -/
def oneHotCells (truth : ByteArray) (rows nc : Nat) : ByteArray := Id.run do
  let mut y := ByteArray.empty
  for i in [0:rows * nc] do
    for st in [0:3] do y := pushF32LE y (if truth.get! i == st.toUInt8 then 1.0 else 0.0)
  return y

/-- M4d with the probe fit on `g`'s own latents rather than `h`'s: at each depth k, the
    imagined latents along `lines` and the true boards they stand for, split by the true
    board's index parity (so a board reached from two starts stays on one side), fit on the
    even boards, scored on the odd. Per k ≥ 1: [held-out rows, correct cells, whole boards]. -/
def scoreGProbe (M : Model) (P : Params) (starts : Array Pos) (lines : Array (Array Nat)) (L : Nat)
    (lam : Float) (fitCap : Nat := 0) : IO (Array (Nat × Nat × Nat)) := do
  let nc := M.nc
  let mut lats : Array ByteArray := Array.replicate (L + 1) .empty
  let mut truths : Array ByteArray := Array.replicate (L + 1) .empty
  let mut odd : Array (Array Bool) := Array.replicate (L + 1) #[]
  let mut off := 0
  while off < starts.size do
    let m := min M.bf (starts.size - off)
    let rows := (Array.range m).map (· + off)
    let mut pos := rows.map (starts[·]!)
    let mut lat ← represent M P (idxBA pos) m
    for k in [0:L] do
      let acts := (Array.range m).map fun i => (lines[rows[i]!]!)[k]?.getD 0
      let (lat', _) ← imagine M P lat acts m
      lat := lat'
      for i in [0:m] do
        if lines[rows[i]!]!.size > k then pos := pos.set! i (pos[i]!.play acts[i]!)
      for i in [0:m] do
        if lines[rows[i]!]!.size > k && !pos[i]!.terminal then
          lats := lats.modify (k + 1) (· ++ lat.extract (4 * M.D * i) (4 * M.D * (i + 1)))
          truths := truths.modify (k + 1) (· ++ moverCells pos[i]!)
          odd := odd.modify (k + 1) (·.push (pos[i]!.index % 2 == 1))
    off := off + m
  let mut out := #[]
  for k in [1:L + 1] do
    let fitAll := (Array.range odd[k]!.size).filter (!odd[k]![·]!)
    -- `fitCap` > 0 fits every depth on the same number of boards, so depths compare
    let fitR := if fitCap > 0 then fitAll.extract 0 fitCap else fitAll
    let heldR := (Array.range odd[k]!.size).filter (odd[k]![·]!)
    if fitR.size < 2 * M.D || (fitCap > 0 && fitR.size < fitCap) || heldR.isEmpty then
      out := out.push (0, 0, 0)
      continue
    let tr := truths[k]!
    let pick (rs : Array Nat) := rs.foldl (fun a i => a ++ tr.extract (nc * i) (nc * (i + 1))) .empty
    let W ← ridge (rowsOf lats[k]! M.D fitR) (oneHotCells (pick fitR) fitR.size nc) fitR.size.toUSize
      M.D.toUSize (3 * nc).toUSize lam
    let sc ← probeScore W (rowsOf lats[k]! M.D heldR) (pick heldR) heldR.size.toUSize M.D.toUSize nc.toUSize
    let mut c := 0
    let mut b := 0
    for j in [0:heldR.size] do
      let ok := readU32LE sc (4 * j)
      c := c + ok
      if ok == nc then b := b + 1
    out := out.push (heldR.size, c, b)
  return out

/-- `count` decision positions' true dynamics against the model on every legal move from
    each (M4a at one move, exhaustive): r's recall on the winning moves and its false calls on
    the rest, split by the start's visited flag. -/
def scoreRewards (M : Model) (P : Params) (seen : Std.HashSet Nat) (starts : Array Pos) :
    IO (Array Nat) := do
  let mut pairs : Array (Pos × Nat) := #[]
  for p in starts do
    for a in p.legal do pairs := pairs.push (p, a)
  -- [winN, winHit, restN, restHit] × split
  let mut out := Array.replicate 8 0
  let mut off := 0
  while off < pairs.size do
    let m := min M.bf (pairs.size - off)
    let chunk := pairs.extract off (off + m)
    let lat ← represent M P (idxBA (chunk.map (·.1))) m
    let (_, ro) ← imagine M P lat (chunk.map (·.2)) m
    for i in [0:m] do
      let (p, a) := chunk[i]!
      let p' := p.play a
      let won := p'.terminal && p'.result != 0
      let called := Float.tanh (F32.read ro i.toUSize) > 0.5
      let b := 4 * (if seen.contains p.index then 1 else 0)
      out := if won then (out.modify b (· + 1)).modify (b + 1) (· + (if called then 1 else 0))
             else (out.modify (b + 2) (· + 1)).modify (b + 3) (· + (if called then 1 else 0))
    off := off + m
  return out

def l2Row (x : ByteArray) (i : Nat) (y : ByteArray) (j : Nat) (D : Nat) : Float := Id.run do
  let mut s := 0.0
  for d in [0:D] do
    let e := F32.read x (i * D + d).toUSize - F32.read y (j * D + d).toUSize
    s := s + e * e
  return s.sqrt

/-- M4c: from each start with three empty cells a, b, c (drawn per start), the two move
    orders a b c and c b a reach one board. The two imagined latents' distance, against
    each one's distance to h of the true board and two different boards' latents' distance;
    the two imagined values' disagreement and their signs against the exact value. -/
def scoreTranspositions (M : Model) (P : Params) (t : Table) (starts : Array Pos) (g0 : StdGen) :
    IO (Array Float × Nat × StdGen) := do
  let mut g := g0
  let mut trip : Array (Pos × Nat × Nat × Nat) := #[]
  for p in starts do
    let e := p.legal
    if e.size ≥ 4 then
      let (i, g1) := randNat g 0 (e.size - 1)
      let (j, g2) := randNat g1 0 (e.size - 2)
      let (k, g3) := randNat g2 0 (e.size - 3)
      g := g3
      let e1 := e.eraseIdx! i
      let e2 := e1.eraseIdx! j
      let (a, b, c) := (e[i]!, e1[j]!, e2[k]!)
      let ok (x y z : Nat) := let p1 := p.play x; let p2 := p1.play y
        !p1.terminal && !p2.terminal && !(p2.play z).terminal
      if ok a b c && ok c b a then trip := trip.push (p, a, b, c)
  -- sums: ‖s₁ − s₂‖, ‖s₁ − h‖, ‖s₂ − h‖, ‖s₁ − s₁'‖ (another row), |v₁ − v₂|, sign v₁, sign v₂, sign v_h
  let mut sum := Array.replicate 8 0.0
  let mut off := 0
  let D := M.D
  while off < trip.size do
    let m := min M.bf (trip.size - off)
    let ch := trip.extract off (off + m)
    let l0 ← represent M P (idxBA (ch.map (·.1))) m
    let (x1, _) ← imagine M P l0 (ch.map (·.2.1)) m
    let (x2, _) ← imagine M P x1 (ch.map (·.2.2.1)) m
    let (s1, _) ← imagine M P x2 (ch.map (·.2.2.2)) m
    let (y1, _) ← imagine M P l0 (ch.map (·.2.2.2)) m
    let (y2, _) ← imagine M P y1 (ch.map (·.2.2.1)) m
    let (s2, _) ← imagine M P y2 (ch.map (·.2.1)) m
    let finals := ch.map fun (p, a, b, c) => (p.play a).play b |>.play c
    let sh ← represent M P (idxBA finals) m
    let v (s : ByteArray) : IO ByteArray := M.f.fwd P.f s m true
    let (f1, f2, fh) := (← v s1, ← v s2, ← v sh)
    for i in [0:m] do
      let val (f : ByteArray) := Float.tanh (F32.read f (i * M.nOut + M.nc).toUSize)
      let exF := Float.ofInt (t.value finals[i]!)
      let sgn (x : Float) : Float := if (x > 0.0 && exF > 0.0) || (x < 0.0 && exF < 0.0) ||
        (x.abs < 0.5 && exF == 0.0) then 1.0 else 0.0
      sum := #[sum[0]! + l2Row s1 i s2 i D, sum[1]! + l2Row s1 i sh i D, sum[2]! + l2Row s2 i sh i D,
               sum[3]! + l2Row s1 i s1 ((i + 1) % m) D, sum[4]! + (val f1 - val f2).abs,
               sum[5]! + sgn (val f1), sum[6]! + sgn (val f2), sum[7]! + sgn (val fh)]
    off := off + m
  return (sum.map (· / (max 1 trip.size).toFloat), trip.size, g)

/-- M4b in the search: the latent search's principal line from every start (`sims`
    simulations), replayed on the true board. Returns per split [lines, through a taken cell,
    past the true end]. -/
def scorePrincipal (M : Model) (P : Params) (seen : Std.HashSet Nat) (starts : Array Pos) (sims L : Nat)
    (g0 : StdGen) : IO (Array Nat × StdGen) := do
  let mut out := Array.replicate 6 0
  let mut g := g0
  let mut off := 0
  while off < starts.size do
    let m := min M.bf (starts.size - off)
    let ch := starts.extract off (off + m)
    g ← search M P ch sims false g
    let pv ← muzPrincipal M.arena L.toUSize
    for i in [0:m] do
      let len := pv.get! (i * (L + 1))
      let mut p := ch[i]!
      let mut taken := false
      let mut past := false
      for j in [0:len.toNat] do
        let a := (pv.get! (i * (L + 1) + 1 + j)).toNat
        if p.terminal then
          past := true
          break
        if p.cells[a]! != 0 then
          taken := true
          break
        p := p.play a
      let b := 3 * (if seen.contains ch[i]!.index then 1 else 0)
      out := ((out.modify b (· + 1)).modify (b + 1) (· + (if taken then 1 else 0))).modify (b + 2)
        (· + (if past then 1 else 0))
    off := off + m
  return (out, g)

/-- The search's own mistakes, against the false-win account: from every start, the move the
    search plays (`sims` simulations, the argmax of the root visits) and the net alone's move,
    each judged on the exact table; then the search's principal line imagined from `h` of the
    start, `r` read at every step. A phantom win is a step `r` calls a win (tanh r > ½) whose
    move does NOT win on the true board (a losing or drawing move, a taken cell, or a move past
    the true end). Returns, for [search blunders where the net alone was right, every other
    start]: [starts, with a phantom win for the mover's side, with one for the opponent's]. -/
def scoreBlunders (M : Model) (P : Params) (t : Table) (starts : Array Pos) (sims L : Nat)
    (g0 : StdGen) : IO (Array Nat × StdGen) := do
  let mut out := Array.replicate 6 0
  let mut g := g0
  let mut off := 0
  let optimal := fun (p : Pos) (a : Nat) => -(t.value (p.play a)) == t.value p
  while off < starts.size do
    let m := min M.bf (starts.size - off)
    let ch := starts.extract off (off + m)
    let logits ← rootLogits M P (idxBA ch) m
    g ← search M P ch sims false g
    let pis ← visitDists M m
    let pv ← muzPrincipal M.arena L.toUSize
    -- phantom wins along each principal line, by parity (0 the mover's side)
    let mut phantom : Array (Array Bool) := Array.replicate m #[false, false]
    let mut lat ← represent M P (idxBA ch) m
    let mut cur := ch
    let mut gone : Array Bool := Array.replicate m false   -- the true replay has left the board
    for j in [0:L] do
      let acts := (Array.range m).map fun i =>
        if j < (pv.get! (i * (L + 1))).toNat then (pv.get! (i * (L + 1) + 1 + j)).toNat else 0
      let (s, r) ← imagine M P lat acts m
      lat := s
      for i in [0:m] do
        if j ≥ (pv.get! (i * (L + 1))).toNat then continue
        let a := acts[i]!
        let p := cur[i]!
        let trueWin := !gone[i]! && !p.terminal && p.cells[a]! == 0 && (p.play a).terminal &&
          (p.play a).result != 0
        if Float.tanh (F32.read r i.toUSize) > 0.5 && !trueWin then
          phantom := phantom.modify i (·.set! (j % 2) true)
        if gone[i]! || p.terminal || p.cells[a]! != 0 then gone := gone.set! i true
        else cur := cur.set! i (p.play a)
    for i in [0:m] do
      let p := ch[i]!
      let sMove := argmaxLegal (fun c => pis[i]![c]!) p
      let nMove := argmaxLegal (fun c => F32.read logits (i * M.nOut + c).toUSize) p
      let b := if !optimal p sMove && optimal p nMove then 0 else 3
      out := ((out.modify b (· + 1)).modify (b + 1) (· + (if phantom[i]![0]! then 1 else 0))).modify (b + 2)
        (· + (if phantom[i]![1]! then 1 else 0))
    off := off + m
  return (out, g)

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
  -- `steps=` fixes the train steps an iteration; 0 is AlphaZero's schedule, `epochs` passes
  -- over the whole window (≈ 300 · i steps at iteration i at 3×3)
  let stepsPer := natArg "steps" 0
  let lr := floatArg "lr" 1.0e-3
  let window := natArg "window" 20
  let cpuct := floatArg "cpuct" 1.25
  let alpha := floatArg "alpha" 1.0
  let eps := floatArg "noise" 0.25
  let tempPlies := natArg "tempPlies" (n * n)
  let seed := natArg "seed" 1
  let aug := natArg "aug" 1 == 1
  let qnorm := natArg "qnorm" 1 == 1
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
  -- the eight views must be symmetries of the game: each decision position lands on one
  -- with the same exact value (a view that broke a line would change some value)
  for d in [0:8] do
    let perm := dihedral n d
    for i in [0:nDec] do
      let p := Pos.ofIndex n k (readU64 decIdx i)
      let q := Pos.ofIndex n k (permIndex perm (readU64 decIdx i))
      unless table.reachable q && table.value q == table.value p do
        throw <| IO.userError s!"dihedral view {d} is not a symmetry at position {readU64 decIdx i}"

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
C {C}, K {K}, {iters} iterations of {bf} games at {sims} sims, batch {B} × {if stepsPer > 0 then s!"{stepsPer} steps an iteration" else s!"{epochs} epochs"} over the last \
{window} iterations{if aug then ", dihedral views" else ""}, lr {lr}, cpuct {cpuct}{if qnorm then "" else " (raw Q)"}, Dir({alpha}) at {eps}, seed {seed} \
(graphs {(← IO.monoMsNow) - t0} ms)"
  let mut P : Params ← match kv "params" with
    | some f => do
      let b ← IO.FS.readBinFile f
      unless b.size == nP * 4 do throw <| IO.userError s!"{f}: {b.size} bytes, expected {nP * 4}"
      let o1 := hN.nP * 4
      let o2 := o1 + gN.nP * 4
      let o3 := o2 + fN.nP * 4
      pure { h := b.extract 0 o1, g := b.extract o1 o2, f := b.extract o2 o3, r := b.extract o3 b.size }
    -- `initSeed=` moves the four He inits together (default 11: h 11, g 12, f 13, r 14,
    -- the Phase 3 runs'); `seed=` drives play and sampling only
    | none =>
      let i0 := natArg "initSeed" 11
      pure { h := ← hN.spec.heInitParams i0.toUSize, g := ← gN.spec.heInitParams (i0 + 1).toUSize,
             f := ← fN.spec.heInitParams (i0 + 2).toUSize, r := ← rN.spec.heInitParams (i0 + 3).toUSize }
  let arena ← muzAlloc bf.toUSize n.toUSize C.toUSize (sims + 1).toUSize
  let M : Model := { n, C, bf, h := hN, g := gN, f := fN, r := rN, cpuct, alpha, eps, arena, qnorm }
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

  if mode == "score" then
    -- §6 on the saved net: `params=<prefix>_params.bin`, the visited set beside it
    let seenPath := (kv "seen").getD (((kv "params").getD "").replace "_params.bin" "_seen.bin")
    let seenBA ← if ← System.FilePath.pathExists seenPath then IO.FS.readBinFile seenPath else pure .empty
    let seen : Std.HashSet Nat := (List.range (seenBA.size / 8)).foldl (fun s i => s.insert (readU64 seenBA i)) {}
    let L := natArg "lines" (2 * K)
    let starts := (Array.range nDec).map fun i => Pos.ofIndex n k (readU64 decIdx i)
    let nSeen := starts.foldl (fun a p => if seen.contains p.index then a + 1 else a) 0
    IO.eprintln s!"score: {nDec} decision positions, {nSeen} visited by self-play ({seenPath}), lines of up to {L} moves"
    let mut csv := "metric,source,k,split,count,value\n"
    let row (metric src : String) (kk : Nat) (split : String) (cnt : Nat) (v : Float) : String :=
      s!"{metric},{src},{kk},{split},{cnt},{fmt v 6}\n"
    -- M1
    let mut g := mkStdGen (seed + 1000)
    for (oppName, opp) in [("perfect", perfectPlayer table), ("random", randomPlayer)] do
      for s in [0, sims] do
        let (x, g1) ← matchVs M P opp root true s g
        let (o, g2) ← matchVs M P opp root false s g1
        g := g2
        IO.eprintln s!"  M1 vs {oppName}, {if s == 0 then "net alone" else s!"search {s}"}: as X {x.str}, as O {o.str} (W/D/L)"
        for (side, r) in [("x", x), ("o", o)] do
          csv := csv ++ row s!"m1_{oppName}_{side}_w" (if s == 0 then "alone" else "search") s "all" bf r.w.toFloat
          csv := csv ++ row s!"m1_{oppName}_{side}_d" (if s == 0 then "alone" else "search") s "all" bf r.d.toFloat
          csv := csv ++ row s!"m1_{oppName}_{side}_l" (if s == 0 then "alone" else "search") s "all" bf r.l.toFloat
    -- M2 split by visit
    for (split, keep) in [("all", fun (_ : Pos) => true), ("seen", fun p => seen.contains p.index),
                          ("unseen", fun p => !seen.contains p.index)] do
      let ps := starts.filter keep
      if ps.isEmpty then continue
      let (agree, mse, sign) ← sweep M P table (idxBA ps) ps.size
      IO.eprintln s!"  M2 f∘h, {split} ({ps.size}): agree {fmt (100.0 * agree) 2}%  value mse {fmt mse 4}  sign {fmt (100.0 * sign) 2}%"
      csv := csv ++ row "m2_agree" "root" 0 split ps.size agree ++ row "m2_value_mse" "root" 0 split ps.size mse ++
        row "m2_sign" "root" 0 split ps.size sign
    -- M4d: the probe, fit on h of half the decision positions, held out on the other half
    let lat ← representAll M P decIdx nDec
    let fitRows := (Array.range nDec).filter (· % 2 == 0)
    let heldRows := (Array.range nDec).filter (· % 2 == 1)
    let mut Y := ByteArray.empty
    for i in fitRows do
      let mc := moverCells starts[i]!
      for c in [0:nc] do
        for st in [0:3] do Y := pushF32LE Y (if mc.get! c == st.toUInt8 then 1.0 else 0.0)
    let W ← ridge (rowsOf lat M.D fitRows) Y fitRows.size.toUSize M.D.toUSize (3 * nc).toUSize
      (floatArg "probeLambda" 1.0)
    let heldTruth := heldRows.foldl (fun a i => a ++ moverCells starts[i]!) .empty
    let hs ← probeScore W (rowsOf lat M.D heldRows) heldTruth heldRows.size.toUSize M.D.toUSize nc.toUSize
    let mut hc := 0
    let mut hb := 0
    for j in [0:heldRows.size] do
      let ok := readU32LE hs (4 * j)
      hc := hc + ok
      if ok == nc then hb := hb + 1
    IO.eprintln s!"  M4d probe on h, held out ({heldRows.size}): cells {fmt (100.0 * hc.toFloat / (heldRows.size * nc).toFloat) 2}%  \
whole boards {fmt (100.0 * hb.toFloat / heldRows.size.toFloat) 2}%"
    csv := csv ++ row "m4d_probe_cells_heldout" "root" 0 "all" heldRows.size (hc.toFloat / (heldRows.size * nc).toFloat) ++
      row "m4d_probe_boards_heldout" "root" 0 "all" heldRows.size (hb.toFloat / heldRows.size.toFloat)
    -- M3, M4a / b / d along imagined lines
    for src in ["own", "perfect", "random"] do
      let (lines, g1) ← genLines M P table starts L src g
      g := g1
      let acc ← scoreLines M P W seen starts lines L
      IO.eprintln s!"  lines: {src} — per k, per split: n: policy agree / value sign; then all: argmax on a taken cell, probe cells / whole boards, r recall / false calls"
      for kk in [0:L + 1] do
        let mut cells := ""
        for (split, sls) in [("seen", [2 * kk + 1]), ("unseen", [2 * kk]), ("all", [2 * kk, 2 * kk + 1])] do
          let cnt := sls.foldl (fun a sl => a + acc.n[sl]!) 0
          if cnt == 0 then continue
          let ix := sls.foldl (fun a sl => a ++ acc.idx[sl]!) .empty
          let lg := sls.foldl (fun a sl => a ++ acc.logits[sl]!) .empty
          let r ← table.score ix cnt lg nOut
          let c := cnt.toFloat
          let sum (f : LineAcc → Array Nat) := (sls.foldl (fun a sl => a + (f acc)[sl]!) 0).toFloat
          let (wn, wh, rn, rh) := (sum (·.winN), sum (·.winHit), sum (·.restN), sum (·.restHit))
          csv := csv ++ row "m3_agree" src kk split cnt (F32.read r 0 / c) ++ row "m3_value_mse" src kk split cnt (F32.read r 1 / c) ++
            row "m3_sign" src kk split cnt (F32.read r 2 / c) ++ row "m4b_argmax_taken" src kk split cnt (sum (·.occupied) / c) ++
            row "m4d_probe_cells" src kk split cnt (sum (·.probeCells) / (c * nc.toFloat)) ++
            row "m4d_probe_boards" src kk split cnt (sum (·.probeBoards) / c)
          if kk ≥ 1 && wn > 0 then csv := csv ++ row "m4a_reward_recall" src kk split wn.toUInt64.toNat (wh / wn)
          if kk ≥ 1 && rn > 0 then csv := csv ++ row "m4a_reward_false" src kk split rn.toUInt64.toNat (rh / rn)
          if split == "all" then
            cells := cells ++ s!"   {fmt (100.0 * sum (·.occupied) / c) 1}%   {fmt (100.0 * sum (·.probeCells) / (c * nc.toFloat)) 1}% / {fmt (100.0 * sum (·.probeBoards) / c) 1}%   \
{if wn > 0 then fmt (100.0 * wh / wn) 1 else "–"}% / {if rn > 0 then fmt (100.0 * rh / rn) 2 else "–"}%"
          else cells := cells ++ s!"   {split} {cnt}: {fmt (100.0 * F32.read r 0 / c) 1}% / {fmt (100.0 * F32.read r 2 / c) 1}%"
        unless cells.isEmpty do IO.eprintln s!"    k {kk}{cells}"
      -- the probe refit on g's latents at each depth (held out by board)
      let gp ← scoreGProbe M P starts lines L (floatArg "probeLambda" 1.0) (natArg "gprobeFit" 0)
      let mut gs := ""
      for j in [0:gp.size] do
        let (gn, gc, gb) := gp[j]!
        if gn == 0 then continue
        gs := gs ++ s!"  k {j + 1} ({gn}): {fmt (100.0 * gc.toFloat / (gn * nc).toFloat) 1}% / {fmt (100.0 * gb.toFloat / gn.toFloat) 1}%"
        csv := csv ++ row "m4d_gprobe_cells_heldout" src (j + 1) "all" gn (gc.toFloat / (gn * nc).toFloat) ++
          row "m4d_gprobe_boards_heldout" src (j + 1) "all" gn (gb.toFloat / gn.toFloat)
      IO.eprintln s!"    probe refit on g, held out by board, cells / whole boards:{gs}"
    -- M4a exhaustive at one move
    let rw ← scoreRewards M P seen starts
    for (split, b) in [("unseen", 0), ("seen", 4)] do
      if rw[b]! > 0 then csv := csv ++ row "m4a_reward_recall_every_move" "all" 1 split rw[b]! (rw[b + 1]!.toFloat / rw[b]!.toFloat)
      if rw[b + 2]! > 0 then csv := csv ++ row "m4a_reward_false_every_move" "all" 1 split rw[b + 2]! (rw[b + 3]!.toFloat / rw[b + 2]!.toFloat)
    let ratio (a b : Nat) : String := if b == 0 then "–" else fmt (100.0 * a.toFloat / b.toFloat) 2
    IO.eprintln s!"  M4a every legal move from every decision position: winning moves called {ratio (rw[1]! + rw[5]!) (rw[0]! + rw[4]!)}% \
({rw[0]! + rw[4]!}), others called wins {ratio (rw[3]! + rw[7]!) (rw[2]! + rw[6]!)}% ({rw[2]! + rw[6]!}); \
visited starts {ratio rw[5]! rw[4]!}% / {ratio rw[7]! rw[6]!}%, unvisited {ratio rw[1]! rw[0]!}% / {ratio rw[3]! rw[2]!}%"
    -- M4b in the search
    let (pv, g2) ← scorePrincipal M P seen starts sims L g
    g := g2
    IO.eprintln s!"  M4b search principal lines ({sims} sims): through a taken cell {ratio (pv[1]! + pv[4]!) (pv[0]! + pv[3]!)}%, \
past the true end {ratio (pv[2]! + pv[5]!) (pv[0]! + pv[3]!)}%  (visited {ratio pv[4]! pv[3]!}% / unvisited {ratio pv[1]! pv[0]!}% taken)"
    for (split, b) in [("unseen", 0), ("seen", 3)] do
      if pv[b]! > 0 then
        csv := csv ++ row "m4b_pv_taken" "search" sims split pv[b]! (pv[b + 1]!.toFloat / pv[b]!.toFloat) ++
          row "m4b_pv_past_end" "search" sims split pv[b]! (pv[b + 2]!.toFloat / pv[b]!.toFloat)
    -- the false-win account of the search's mistakes
    let (bl, g3) ← scoreBlunders M P table starts sims L g
    g := g3
    IO.eprintln s!"  blunders ({sims} sims): {bl[0]!} starts where the search errs and the net alone does not; \
phantom win on the line for the mover {ratio bl[1]! bl[0]!}% / the opponent {ratio bl[2]! bl[0]!}%; \
the other {bl[3]!} starts {ratio bl[4]! bl[3]!}% / {ratio bl[5]! bl[3]!}%"
    csv := csv ++ row "blunders" "search" sims "all" bl[0]! bl[0]!.toFloat ++
      row "blunder_phantom_mover" "search" sims "blunder" bl[0]! (bl[1]!.toFloat / (max 1 bl[0]!).toFloat) ++
      row "blunder_phantom_opp" "search" sims "blunder" bl[0]! (bl[2]!.toFloat / (max 1 bl[0]!).toFloat) ++
      row "blunder_phantom_mover" "search" sims "rest" bl[3]! (bl[4]!.toFloat / (max 1 bl[3]!).toFloat) ++
      row "blunder_phantom_opp" "search" sims "rest" bl[3]! (bl[5]!.toFloat / (max 1 bl[3]!).toFloat)
    -- M4c
    let (tr, nT, _) ← scoreTranspositions M P table starts g
    IO.eprintln s!"  M4c transpositions ({nT} pairs a b c / c b a): ‖s₁ − s₂‖ {fmt tr[0]! 3}, ‖s − h(board)‖ {fmt tr[1]! 3} / {fmt tr[2]! 3}, \
two different boards {fmt tr[3]! 3}; |v₁ − v₂| {fmt tr[4]! 3}; value sign vs exact {fmt (100.0 * tr[5]!) 1}% / {fmt (100.0 * tr[6]!) 1}% (h of the board {fmt (100.0 * tr[7]!) 1}%)"
    for (nm, i) in [("m4c_dist_pair", 0), ("m4c_dist_to_h_1", 1), ("m4c_dist_to_h_2", 2), ("m4c_dist_other_board", 3),
                    ("m4c_value_gap", 4), ("m4c_sign_1", 5), ("m4c_sign_2", 6), ("m4c_sign_h", 7)] do
      csv := csv ++ row nm "random" 3 "all" nT tr[i]!
    let out := ((kv "params").getD s!"{pfx}_params.bin").replace "_params.bin" "_score.csv"
    IO.FS.writeFile out csv
    IO.eprintln s!"wrote {out} ({(← IO.monoMsNow) - t0} ms)"
    return

  let mut g := mkStdGen seed
  if mode == "dump" then
    -- one batch of self-play at the initial parameters, one batch's gradients, for the JAX gate
    let (games, g1) ← selfPlay M P root sims tempPlies g
    let (b, _) := sampleBatch games B K nc g1 aug
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
    let (aX, g) ← matchVs M P (perfectPlayer table) root true 0 g
    let (aO, g) ← matchVs M P (perfectPlayer table) root false 0 g
    let (mX, g) ← matchVs M P (perfectPlayer table) root true sims g
    let (mO, g) ← matchVs M P (perfectPlayer table) root false sims g
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
    let nSteps := if stepsPer > 0 then stepsPer else epochs * N / B
    let mut lAcc := #[0.0, 0.0, 0.0]
    let mut clAcc := 0
    for _ in [0:nSteps] do
      let (b, g') := sampleBatch all B K nc g aug
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
    IO.FS.writeBinFile s!"{pfx}_seen.bin" (seen.fold (fun acc ix => pushU64LE acc ix) .empty)
  IO.eprintln s!"trained: {iters} iterations, {steps} steps, {(← IO.monoMsNow) - t0} ms; \
self-play stood at {seen.size} of the {nDec} decision positions"
  IO.eprintln s!"wrote {pfx}_curve.csv, {pfx}_params.bin, {pfx}_seen.bin"
