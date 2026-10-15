module

public import LeanMlir
public import LeanMlir.VjpOracleNets

@[expose] public section

-- VJP oracle, verified side: `VjpOracle.residualNet` (spec shared with jax/tests/vjp_oracle/phase2/).

def main (args : List String) : IO Unit :=
  VjpOracle.residualNet.train VjpOracle.cfg (args.head?.getD "data") .mnist
