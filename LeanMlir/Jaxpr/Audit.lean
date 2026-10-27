module
import LeanMlir.Jaxpr.SSA
import LeanMlir.Jaxpr.Native.Select
import LeanMlir.Jaxpr.Native.NaNExecution
import LeanMlir.Jaxpr.Native.Addressing
import LeanMlir.Jaxpr.Native.Fetch
import Lean

open Lean in
run_cmd do
  for name in #[``LeanMlir.Jaxpr.compile_correct, ``LeanMlir.Jaxpr.decode_encode,
      ``LeanMlir.Jaxpr.backend_correct, ``LeanMlir.Jaxpr.compilePred_correct,
      ``LeanMlir.Jaxpr.compileStmt_correct, ``LeanMlir.Jaxpr.compile_boundedWhile_correct,
      ``LeanMlir.Jaxpr.compileJaxpr_correct,
      ``LeanMlir.Jaxpr.Native.ofBits_toBits,
      ``LeanMlir.Jaxpr.Native.ofBits_xor_sign,
      ``LeanMlir.Jaxpr.Native.ofBits_and_abs,
      ``LeanMlir.Jaxpr.Native.readWord_writeWord,
      ``LeanMlir.Jaxpr.Native.readWord_writeWord_other,
      ``LeanMlir.Jaxpr.Native.decodeInstruction_encode,
      ``LeanMlir.Jaxpr.Native.selectEquations_correct,
      ``LeanMlir.Jaxpr.Native.selectedBytes_correct,
      ``LeanMlir.Jaxpr.Native.canonical_execution,
      ``LeanMlir.Jaxpr.Native.jaxpr_byte_execution,
      ``LeanMlir.Jaxpr.Native.jaxpr_byte_execution_exists,
      ``LeanMlir.Jaxpr.Native.selectEquations_indexSafe,
      ``LeanMlir.Jaxpr.Native.indexed_address_correct,
      ``LeanMlir.Jaxpr.Native.execution_preserves_code,
      ``LeanMlir.Jaxpr.Native.separated_layout,
      ``LeanMlir.Jaxpr.Native.jaxpr_fetched_execution,
      ``LeanMlir.Jaxpr.Native.jaxpr_fetched_execution_exists] do
    for axiomName in ← collectAxioms name do
      unless #[``propext, ``Classical.choice, ``Quot.sound].contains axiomName do
        throwError "Unexpected axiom in {name}: {axiomName}"
#print axioms LeanMlir.Jaxpr.compile_correct
#print axioms LeanMlir.Jaxpr.decode_encode
#print axioms LeanMlir.Jaxpr.backend_correct
#print axioms LeanMlir.Jaxpr.compilePred_correct
#print axioms LeanMlir.Jaxpr.compileStmt_correct
#print axioms LeanMlir.Jaxpr.compile_boundedWhile_correct
#print axioms LeanMlir.Jaxpr.compileJaxpr_correct
#print axioms LeanMlir.Jaxpr.Native.ofBits_toBits
#print axioms LeanMlir.Jaxpr.Native.ofBits_xor_sign
#print axioms LeanMlir.Jaxpr.Native.ofBits_and_abs
#print axioms LeanMlir.Jaxpr.Native.readWord_writeWord
#print axioms LeanMlir.Jaxpr.Native.readWord_writeWord_other
#print axioms LeanMlir.Jaxpr.Native.decodeInstruction_encode
#print axioms LeanMlir.Jaxpr.Native.selectEquations_correct
#print axioms LeanMlir.Jaxpr.Native.selectedBytes_correct
#print axioms LeanMlir.Jaxpr.Native.canonical_execution
#print axioms LeanMlir.Jaxpr.Native.jaxpr_byte_execution
#print axioms LeanMlir.Jaxpr.Native.jaxpr_byte_execution_exists
#print axioms LeanMlir.Jaxpr.Native.selectEquations_indexSafe
#print axioms LeanMlir.Jaxpr.Native.indexed_address_correct
#print axioms LeanMlir.Jaxpr.Native.execution_preserves_code
#print axioms LeanMlir.Jaxpr.Native.separated_layout
#print axioms LeanMlir.Jaxpr.Native.jaxpr_fetched_execution
#print axioms LeanMlir.Jaxpr.Native.jaxpr_fetched_execution_exists
