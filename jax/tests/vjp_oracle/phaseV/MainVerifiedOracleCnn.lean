import Jax
import LeanMlir.VjpOracleNets

-- Verified-path VJP oracle, JAX side: `VerifiedOracle.cnnNet`, the Chapter-3 net as the verified
-- trainer runs it. The Lean side is the committed artifact itself (`apps/mnist/MainMnistCnnVerified`);
-- see tests/vjp_oracle/run_verified.sh.

#eval VerifiedOracle.cnnNet.validate!

def main (args : List String) : IO Unit :=
  runJax VerifiedOracle.cnnNet VerifiedOracle.cfg .mnist (args.head? |>.getD "data") "generated_verified_oracle_cnn.py"
