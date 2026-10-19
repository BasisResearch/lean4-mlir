import Jax
import LeanMlir.VjpOracleNets

-- Verified-path VJP oracle, JAX side: `VerifiedOracle.mlpNet`, the Chapter-2 net as the verified
-- trainer runs it. The Lean side is the committed artifact itself (`apps/mnist/MainMnistMlpVerified`);
-- see tests/vjp_oracle/run_verified.sh.

#eval VerifiedOracle.mlpNet.validate!

def main (args : List String) : IO Unit :=
  runJax VerifiedOracle.mlpNet VerifiedOracle.cfg .mnist (args.head? |>.getD "data") "generated_verified_oracle_mlp.py"
