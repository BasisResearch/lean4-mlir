module

public import LeanMlir
public import LeanMlir.VjpOracleNets

@[expose] public section

-- VJP oracle, verified side: `VjpOracle.mbConvNet` (spec shared with jax/tests/vjp_oracle/phase2/).

def main (args : List String) : IO Unit :=
  VjpOracle.mbConvNet.train VjpOracle.cfg (args.head?.getD "data") .mnist
