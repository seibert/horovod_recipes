#!/bin/bash

set -ex

export HOROVOD_CUDA_HOME=/tmp  # bogus dir

python setup.py install
