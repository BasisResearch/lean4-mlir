// Loop one verified_mlir train step through the shim, N times, with fixed random inputs.
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "iree_ffi.h"
#define RD(...) do { if (fscanf(__VA_ARGS__) < 1) { fprintf(stderr, "bad spec\n"); return 2; } } while (0)
int main(int argc, char** argv) {
  if (argc != 5) { fprintf(stderr, "usage: stress <mlir> <fn> <spec> <iters>\n"); return 2; }
  FILE* sp = fopen(argv[3], "r"); int n_in, n_out; RD(sp, "%d %d", &n_in, &n_out);
  int32_t* ranks = calloc(n_in, 4); int64_t* dims = calloc(n_in * 8, 8); int64_t* totals = calloc(n_out, 8);
  float** in = calloc(n_in, sizeof(float*)); float** outs = calloc(n_out, sizeof(float*)); size_t nd = 0;
  srand(1);
  for (int i = 0; i < n_in; i++) {
    RD(sp, "%d", &ranks[i]); size_t n = 1;
    for (int r = 0; r < ranks[i]; r++) { RD(sp, "%ld", &dims[nd]); n *= dims[nd++]; }
    in[i] = malloc(n * 4); for (size_t k = 0; k < n; k++) in[i][k] = (rand() / (float)RAND_MAX - 0.5f) * 0.1f;
  }
  for (int o = 0; o < n_out; o++) { RD(sp, "%ld", &totals[o]); outs[o] = malloc(totals[o] * 4); }
  iree_ffi_session_t* s = iree_ffi_session_create(argv[1]);
  if (!s) { fprintf(stderr, "FAIL session_create\n"); return 1; }
  long iters = atol(argv[4]);
  for (long it = 0; it < iters; it++) {
    int rc = iree_ffi_invoke_f32(s, argv[2], n_in, ranks, dims, (const float**)in, n_out, totals, outs);
    if (rc) { fprintf(stderr, "FAIL invoke rc=%d at %ld\n", rc, it); return 1; }
    if (it % 1000 == 0) { printf("iter %ld\n", it); fflush(stdout); }
  }
  iree_ffi_session_release(s);
  printf("OK %ld iters\n", iters);
  return 0;
}
