# jax_oneapi_pjrt 0.11.2: use-after-free in the SYCL scheduler when host-to-device copies overlap (Arc Pro B50)

Draft for upstream, 2026-10-11. Target: `jax-ml/jax` (the plugin's PyPI homepage), naming the
plugin; the faulting code is the SYCL runtime (`intel/llvm`), which the plugin pins.

## Summary

Running a small convolutional train step in a loop through the `jax_oneapi_pjrt` PJRT plugin
crashes the process inside `libsycl.so.8` (`intel-sycl-rt` 2025.1.1, the version
`jax_oneapi_plugin[with-oneapi]==0.11.2` pins). Three signatures, all in event/host-task
lifetime code:

- SIGSEGV in `sycl::_V1::detail::event_impl::cleanupDependencyEvents()` (a `lock decl` on a
  freed `shared_ptr` control block)
- SIGSEGV in `sycl::_V1::detail::DispatchHostTask::operator()()` (virtual call through a
  garbage vtable)
- abort: `die: urEventWait must not be called for an internal event`

Every crash we caught has a host-to-device copy in flight: an XLA async-work thread enqueuing
the host callback that completes the copy (`DoHostCallbackWithStatus` → `queue::submit`), or
SYCL's host-task thread waiting on that callback's dependency events. The first core dump also
had the execute thread inside oneDNN's convolution, but that is not required: with every
upload's ready event awaited before `Execute`, the process still aborted with the main thread
idle in `PJRT_Event_Await` and no kernel submitted (third backtrace below). What does stop it
is keeping **one** `BufferFromHostBuffer` in flight at a time (see "Workaround"). Under sustained load the corruption also reaches the
GPU: engine resets with `Fault response: Unsuccessful -ENOENT`, and once the device stopped
answering MMIO (`0xFFFFFFFF`), was wedged by `xe`, and needed a power cycle.

The dense-only MNIST trainers (linear, MLP) finished in the runs we made (one each, not under
the stress harness); the crashes were all on the convolutional net.

## Environment

| | |
|---|---|
| GPU | Intel Arc Pro B50 (8086:e212), 16 GB, BAR 16 GB (Resizable BAR on) |
| Host | Ryzen 9 3950X, ASUS Pro WS X570-ACE (BIOS 5601), Ubuntu 24.04.4 |
| Kernel | 7.0.0-38-generic (HWE), `xe` |
| Compute runtime | `libze-intel-gpu1` / `intel-opencl-icd` 26.31.39395.14, `libze1` 1.32.0 (ppa:kobuk-team/intel-graphics) |
| Plugin | `jax_oneapi_pjrt` 0.11.2 + `jax_oneapi_plugin[with-oneapi]` 0.11.2 → `intel-sycl-rt` 2025.1.1, `intel-cmplr-lib-ur` 2025.1.1, `umf` 0.10.0, oneDNN 3.12.3 (as reported by the plugin) |
| PJRT | plugin API 0.115; caller built against `pjrt_c_api.h` 0.90 |

## Reproducer

The caller is a small C shim over the PJRT C API (client create → compile StableHLO →
`PJRT_LoadedExecutable_Execute` per step, inputs uploaded with `BufferFromHostBuffer`). The
program is a 2-conv + 3-dense MNIST train step at batch 128
(`verified_mlir/cnn_train_step.mlir`, 13 f32 inputs, 11 outputs). `stress.c` loops it with fixed
random inputs:

```
bash runs/2026-10-11-xpu-sycl-race/repro.sh 5 10000
```

| configuration | runs | crashed | notes |
|---|---|---|---|
| 12-epoch MNIST CNN trainer, default | 38 | 3 | each after 9–10 completed epochs |
| `stress`, 10,000 iterations, default | 5 | 5 | 3 of 5 before iteration 1,000; 2 segfaults, 3 `urEventWait` aborts |
| `stress`, `SYCL_DISABLE_EXECUTION_GRAPH_CLEANUP=1` | 1 | 1 | aborted at ~2,000 iterations, RSS 2.5 GB; GPU then dropped off the bus |
| 12-epoch trainer, `PJRT_COMMAND_BUFFERS=0` | 2 | 1 | crash also seen with XLA command buffers off |
| under gdb (trainer) | 6 | 0 | timing-sensitive |
| `stress`, all uploads' ready events awaited before `Execute` | 1 + 1 | 1 + 1 | GPF at `cleanupDependencyEvents`; then a `urEventWait` abort with no `Execute` in flight |
| `stress`, **one upload in flight at a time** | 5 | 0 | 50,000 steps; same build with it off crashed in ~3 s |
| CIFAR-10 8-layer wide CNN, no BN, SGD (`lake run cifar`) | 1 | 1 | GPF at the same `cleanupDependencyEvents` site, during epoch 11 |
| CIFAR-10 8-layer wide CNN, BN, SGD | 1 | 1 | same site, during epoch 5 |

`intel-sycl-rt` 2025.3.3 could not be tested: with the 0.11.2 plugin it fails at client
creation (`level_zero backend failed with error: 2147483646 (UR_RESULT_ERROR_UNKNOWN)` on the
Level-Zero V2 adapter; with `SYCL_UR_USE_LEVEL_ZERO_V2=0`, `Fatal glibc error: tpp.c:83
(__pthread_tpp_change_priority): assertion failed`).

## Backtrace (core dump, trainer, `cleanupDependencyEvents` signature)

Crashing thread (XLA async work queue):

```
#0  sycl::_V1::detail::event_impl::cleanupDependencyEvents()
#1  sycl::_V1::detail::event_impl::cleanDepEventsThroughOneLevel()
#2  sycl::_V1::detail::Command::~Command()
#3  sycl::_V1::detail::ExecCGCommand::~ExecCGCommand()
#4  sycl::_V1::detail::Scheduler::GraphBuilder::cleanupCommand(Command*, bool)
#5  sycl::_V1::detail::Scheduler::cleanupCommands(std::vector<Command*> const&)
#6  sycl::_V1::detail::Scheduler::enqueueCommandForCG(...)
#7  sycl::_V1::detail::Scheduler::addCG(...)
#8  sycl::_V1::handler::finalize()
#9  sycl::_V1::detail::queue_impl::finalizeHandler<handler>(...)
#10 sycl::_V1::detail::queue_impl::submit_impl(...)
#11 sycl::_V1::detail::queue_impl::submit_with_event(...)
#12 sycl::_V1::queue::submit_with_event_impl(...)
#13 stream_executor::sycl::SyclStream::DoHostCallbackWithStatus(...)
#14 stream_executor::Stream::DoHostCallbackWithStatus(...)
#15 xla::LocalDeviceState::ThenExecuteCallback(...)
#16 xla::LocalDeviceState::AllocateAndRecordEvent(...)
#17 xla::PjRtStreamExecutorRawClient::AllocateAndRecordEvent(...)
#18 ...PjRtStreamExecutorRawBuffer::CopyRawHostToDeviceAndReturnEvent(...)::$_1
#19 xla::UnboundedAsyncWorkRunner::Execute(...)::$_0
#20 tsl::UnboundedWorkQueue::PooledThreadFunc()
```

Concurrent thread (execute), stopped in the same submit path:

```
#0  sycl::_V1::handler::finalize()
#1  sycl::_V1::detail::queue_impl::finalizeHandler<handler>(...)
#2  sycl::_V1::detail::queue_impl::submit_impl(...)
#4  sycl::_V1::queue::submit_with_event_impl(...)
#5  dnnl::impl::gpu::intel::sycl::interop_kernel_t::parallel_for(...)
#6  dnnl::impl::gpu::intel::reorder::gen_t::execute(...)
#7  dnnl_primitive_execute
#10 stream_executor::sycl::DoOnednnConv(...)
#11 stream_executor::sycl::OnednnSupport::DoConvolveWithGpuConfig(...)
#12 xla::gpu::ConvolutionThunk::ExecuteOnStream(...)
...
#20 xla::PjRtStreamExecutorRawLoadedExecutable::Execute(...)
```

Kernel log for the two signatures (offsets are file offsets into `libsycl.so.8` 2025.1.1):

```
segfault at 72bff78b4001 ip ... error 4 in libsycl.so.8[302cb7,...]   → DispatchHostTask::operator()+2263 (call *0x10(%rax))
general protection fault ip:... error:0 in libsycl.so.8[217e20,...]   → event_impl::cleanupDependencyEvents()+80 (lock decl 0x8(%r15))
```

Third backtrace (core dump, `stress`, ready events awaited — no `Execute` issued yet):

```
Thread 1 (SYCL host-task worker):
#8  die(char const*)                                    libur_adapter_level_zero.so.0
#9  ur::level_zero::urEventWait(...)
#12 sycl::_V1::detail::DispatchHostTask::waitForEvents() const
#13 sycl::_V1::detail::DispatchHostTask::operator()() const
#14 sycl::_V1::detail::ThreadPool::worker()
Thread 2 (main):
#9  pjrt::PJRT_Event_Await(PJRT_Event_Await_Args*)
#11 (caller awaiting PJRT_Buffer_ReadyEvent for the step's inputs)
```

## Workaround

In the caller, await each upload's `done_with_host_buffer` **and** `PJRT_Buffer_ReadyEvent`
before issuing the next `BufferFromHostBuffer`. Cost on this 13-input step: 8.5 → 10.3 ms;
with parameters kept device-resident (only the batch uploaded) the full CIFAR-10 runs that
crashed before complete (6 of 6 optimizer arms, 40 epochs each).

## What we think is happening

Each in-flight host-to-device copy ends with a host callback submitted from its own XLA
async-work thread. With several in flight, the post-enqueue cleanup of finished commands on one
thread (`enqueueCommandForCG` → `cleanupCommands`) releases a command whose dependency events
another host task or submission still references. A concurrent oneDNN submission can be the
other party but need not be. Either the scheduler's cleanup is not safe against concurrent
`submit`s of host tasks, or the plugin is expected to serialize them and doesn't.

## Asks

1. Confirm whether this is fixed in a newer SYCL runtime, and if so, a plugin build against it
   (0.11.2 pins `intel-sycl-rt==2025.1.1` and does not start on 2025.3.3).
2. If not fixed: route to `intel/llvm` (SYCL scheduler) with this backtrace.
3. Is there a supported knob to serialize the plugin's host-to-device host callbacks in the
   meantime (rather than every caller serializing its uploads)? `SYCL_DISABLE_EXECUTION_GRAPH_CLEANUP=1` is not one (still crashes, and
   leaks).
