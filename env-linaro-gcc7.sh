#!/bin/bash

TOOLCHAIN_ROOT="/home/yuma/work/Android/zmooth/bootloader/toolchains/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu"

if [ ! -x "${TOOLCHAIN_ROOT}/bin/aarch64-linux-gnu-gcc" ]; then
  echo "toolchain not found: ${TOOLCHAIN_ROOT}" >&2
  return 1 2>/dev/null || exit 1
fi

export PATH="${TOOLCHAIN_ROOT}/bin:${PATH}"
export GCC5_AARCH64_PREFIX="${TOOLCHAIN_ROOT}/bin/aarch64-linux-gnu-"

echo "PATH updated with ${TOOLCHAIN_ROOT}/bin"
echo "GCC5_AARCH64_PREFIX=${GCC5_AARCH64_PREFIX}"
