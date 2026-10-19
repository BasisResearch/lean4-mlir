import Jax
import LeanMlir.VjpOracleNets

-- Verified-path VJP oracle, JAX side: `VerifiedOracle.linearNet`, the Chapter-1 net as the verified
-- trainer runs it. The Lean side is the committed artifact itself (`apps/mnist/MainMnistLinearVerified`);
-- see tests/vjp_oracle/run_verified.sh.

#eval VerifiedOracle.linearNet.validate!

def main (args : List String) : IO Unit :=
  runJax VerifiedOracle.linearNet VerifiedOracle.cfg .mnist (args.head? |>.getD "data") "generated_verified_oracle_linear.py"
