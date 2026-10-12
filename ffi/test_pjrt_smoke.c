// Known-answer smoke test for the PJRT shim on a new platform, before any Lean: does
// ffi/libpjrt_ffi.so load the plugin, create a client, compile the committed MNIST renders and
// run one of them to the right numbers? deploy/mac_setup.sh runs it as the rung between "JAX sees
// the GPU" and `lake run mnist`, so a failure names the layer it is in.
//
//   cc -O2 ffi/test_pjrt_smoke.c -ldl -o ffi/test_pjrt_smoke && ./ffi/test_pjrt_smoke
//
// From the repo root, with the shim built and $PJRT_PLUGIN (or the shim's default search) naming
// the plugin. Through the shim's own entry points (dlsym'd, as ffi/lowerer.c does), so the client
// options, compile options and entry renaming are the ones the trainers use.
//
//   1. compile + run verified_mlir/linear_fwd.mlir (dot_general, broadcast, add) on fixed
//      inputs, against the same arithmetic in double on the host
//   2. compile the other five MNIST renders (the MLP and CNN train steps carry every op the
//      tier runs: convolution, reduce_window, its gradient, the softmax cross-entropy)
#include <dlfcn.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct iree_ffi_session_t iree_ffi_session_t;
typedef iree_ffi_session_t* (*create_fn)(const char*);
typedef void (*release_fn)(iree_ffi_session_t*);
typedef int (*invoke_fn)(iree_ffi_session_t*, const char*, int, const int32_t*, const int64_t*,
                         const float* const*, int, const int64_t*, float* const*);

enum { B = 128, IN = 784, OUT = 10 };

// A fixed pseudo-random fill in [-0.5, 0.5), the same on every platform.
static void fill(float* a, size_t n, uint32_t seed) {
  for (size_t i = 0; i < n; i++) {
    seed = seed * 1664525u + 1013904223u;
    a[i] = (float)(seed >> 8) / 16777216.0f - 0.5f;
  }
}

int main(void) {
  const char* shim = "ffi/libpjrt_ffi.so";
  void* h = dlopen(shim, RTLD_NOW | RTLD_LOCAL);
  if (!h) { fprintf(stderr, "FAIL load shim: %s\n", dlerror()); return 1; }
  create_fn create = (create_fn)dlsym(h, "iree_ffi_session_create");
  release_fn release = (release_fn)dlsym(h, "iree_ffi_session_release");
  invoke_fn invoke = (invoke_fn)dlsym(h, "iree_ffi_invoke_f32");
  if (!create || !release || !invoke) { fprintf(stderr, "FAIL shim symbols: %s\n", dlerror()); return 1; }

  // 1. linear_fwd: x[B,IN] · W[IN,OUT] + b[OUT]
  float* x = malloc(sizeof(float) * B * IN);
  float* W = malloc(sizeof(float) * IN * OUT);
  float* b = malloc(sizeof(float) * OUT);
  float* y = malloc(sizeof(float) * B * OUT);
  fill(x, (size_t)B * IN, 1); fill(W, (size_t)IN * OUT, 2); fill(b, OUT, 3);
  iree_ffi_session_t* s = create("verified_mlir/linear_fwd.mlir");
  if (!s) { fprintf(stderr, "FAIL compile verified_mlir/linear_fwd.mlir (the shim's message is above)\n"); return 1; }
  const int32_t ranks[3] = {2, 2, 1};
  const int64_t dims[5] = {B, IN, IN, OUT, OUT};
  const float* const ins[3] = {x, W, b};
  const int64_t totals[1] = {(int64_t)B * OUT};
  float* const outs[1] = {y};
  if (invoke(s, "linear_fwd", 3, ranks, dims, ins, 1, totals, outs)) {
    fprintf(stderr, "FAIL run linear_fwd (the shim's message is above)\n"); return 1;
  }
  double worst = 0;
  for (int i = 0; i < B; i++)
    for (int j = 0; j < OUT; j++) {
      double acc = b[j];
      for (int k = 0; k < IN; k++) acc += (double)x[i * IN + k] * W[k * OUT + j];
      double err = fabs(y[i * OUT + j] - acc);
      if (err > worst) worst = err;
    }
  // 784 f32 products of terms below 0.25: an honest f32 GEMM is ~1e-5 off the double sum.
  // 1e-3 still catches a wrong layout or a dropped bias, which are off by ~0.1 or more.
  printf("linear_fwd: max |device - host| = %.3g over %d outputs (y[0][0] = %.6f)\n",
         worst, B * OUT, y[0]);
  if (!(worst < 1e-3)) { fprintf(stderr, "FAIL linear_fwd numbers\n"); return 1; }
  release(s);

  // 2. compile the rest of the tier
  const char* rest[] = {
    "verified_mlir/linear_train_step.mlir", "verified_mlir/mlp_fwd.mlir",
    "verified_mlir/mlp_train_step.mlir",    "verified_mlir/cnn_fwd.mlir",
    "verified_mlir/cnn_train_step.mlir",
  };
  for (size_t i = 0; i < sizeof(rest) / sizeof(rest[0]); i++) {
    iree_ffi_session_t* t = create(rest[i]);
    if (!t) { fprintf(stderr, "FAIL compile %s (the shim's message is above)\n", rest[i]); return 1; }
    printf("compiled %s\n", rest[i]);
    release(t);
  }
  printf("SMOKE OK\n");
  return 0;
}
