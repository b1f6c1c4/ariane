#!/bin/bash

set -euxo pipefail

mkdir -p ~/x-tools/
[ -d ~/x-tools/riscv64-unknown-elf ] || (curl -fsSL http://b1f6c1c4.info/rv64.tar | tar -C ~/x-tools/ -xv)
ln -s ~/x-tools/riscv64-unknown-elf tmp/ricsv-gnu-toolchain
