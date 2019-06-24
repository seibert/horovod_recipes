# Horovod Conda Packages

Experimental conda packages for Horovod.

Notes/Questions:

* `openmpi` is only available from conda-forge, so that channel must
  be included.
* This package depends on both TensorFlow and PyTorch because it isn't
  clear that Horovod built against a package will work if that package
  is not present.
* The TensorFlow version is pinned currently, out of paranoia about ABI
  compatibility between different TensorFlow versions.
* The main package is `horovod`, which comes in CPU and GPU (CUDA)
  variants.  To select one of them, convenience metapackages
  `horovod-cpu` and `horovod-gpu` exist.
* NVCC doesn't seem to be needed by Horovod, so it might not be necessary
  to pin the Horovod packages to a specific cudatoolkit?
* `HOROVOD_GPU_ALLREDUCE=MPI` seems to segfault the build, so it isn't
  enabled.
* There aren't packages for NCCL2 yet, so that isn't enabled.


## Building Packages

```
conda build -c defaults -c conda-forge _horovod_select/
conda build -c defaults -c conda-forge horovod-cpu-variant/
conda build -c defaults -c conda-forge -m horovod-gpu-variant/conda_build_config_linux_cuda90.yaml horovod-gpu-variant/
conda build -c defaults -c conda-forge horovod-variants/
```

## Test Packages

Creating a GPU environment:

```
conda create -n htest_gpu -c defaults -c conda-forge -c seibert python=3.7 horovod-gpu keras
conda activate htest_gpu
```

Creating a CPU environment (gets CPU built of TensorFlow):

```
conda create -n htest_cpu -c defaults -c conda-forge -c seibert python=3.7 horovod-cpu keras
conda activate htest_cpu
```
