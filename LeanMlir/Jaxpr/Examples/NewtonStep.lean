module
public import LeanMlir.Jaxpr.SSA

@[expose] public section
namespace LeanMlir.Jaxpr.Examples

-- Generated from the actual JAX trace by VerifyNumericalAnalysis.
def newtonStep : Jaxpr :=
{ equations := [
    ⟨1, (.binary .div (.var 0) (.literal 1073741824))⟩,
    ⟨2, (.binary .div (.literal 1065353216) (.var 0))⟩,
    ⟨3, (.binary .add (.var 1) (.var 2))⟩,
    ⟨4, (.binary .mul (.var 3) (.var 3))⟩,
    ⟨5, (.binary .sub (.var 4) (.literal 1073741824))⟩]
  outputs := [(.var 3), (.var 5)] }

theorem newtonStep_compiled (env : Env) :
    (compileJaxpr newtonStep).run env = some (newtonStep.eval env) :=
  compileJaxpr_correct newtonStep env

end LeanMlir.Jaxpr.Examples
