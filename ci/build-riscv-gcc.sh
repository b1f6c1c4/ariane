#!/bin/bash
# call with first argument = 0 to checkout only

set -e
ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
VERSION="691e4e826251c7ec59f883cab18440c87baf45e7"

mkdir -p $RISCV

cd $RISCV

if [ -z ${NUM_JOBS} ]; then
    NUM_JOBS=1
fi


if ! [ -e $RISCV/bin ]; then
    if ! [ -e $RISCV/riscv-gnu-toolchain ]; then
        git gets -P --flat -o $RISCV/riscv-gnu-toolchain \
           https://github.com/riscv/riscv-gnu-toolchain.git $VERSION
    fi

    cd riscv-gnu-toolchain

    if [[ $1 -ne "0" || -z ${1} ]]; then
      echo "Compiling RISC-V Toolchain"
      ./configure --prefix=$RISCV > /dev/null
      make -j${NUM_JOBS} > /dev/null
      echo "Compilation Finished"
    fi
fi
