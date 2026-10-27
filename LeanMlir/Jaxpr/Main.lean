module
import LeanMlir.Jaxpr.Examples.NewtonStep

open LeanMlir.Jaxpr

public def main (args : List String) : IO UInt32 := do
  let [text] := args | IO.eprintln "usage: jaxpr-newton-step <input-f32-uint32-bits>"; return 2
  let some value := text.toNat? | IO.eprintln "invalid uint32 input"; return 2
  if value >= 2^32 then
    IO.eprintln "input exceeds uint32"
    return 2
  let input := Float32.ofBits (UInt32.ofNat value)
  let env : Env := fun slot => if slot = 0 then input else Float32.nan
  match (compileJaxpr Examples.newtonStep).run env with
  | none => IO.eprintln "backend execution failed"; return 1
  | some outputs =>
    IO.println (String.intercalate " " (outputs.map (fun x => toString x.toBits.toNat)))
    return 0
