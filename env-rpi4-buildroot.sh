############################################################################
# This is set according to my buildroot build for RPI4
# C library = uclibc
# Toolchain = aarch64-linux-
############################################################################
export PLATFORM=raspi

# Path to kernel source tree
export KERNEL_PATH="/home/irak101/workspace/raspi/linux"
export KERNEL_VERSION="5.15.28+"

# Buildroot SDK path
export SDK_PATH="/home/irak101/workspace/raspi/SDKs/buildroot-sdk-uclibc-busybox-rpi4"

# Toolchain
export TOOLCHAIN_PREFIX="${SDK_PATH}/bin/aarch64-linux-"
export CC=${TOOLCHAIN_PREFIX}gcc

# Sysroot path
export SYSROOT_PATH="${SDK_PATH}/aarch64-buildroot-linux-uclibc/sysroot"

