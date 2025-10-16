#!/bin/bash
set -ouex pipefail

KERNEL_VERSION="6.16.9-200.fc42.x86_64"

# Check if kernel exist on repository

if ! dnf5 info -q kernel-core-${KERNEL_VERSION} > /dev/null 2>&1; then
    echo "Kernel version not found in fedora repository - Stop."
    exit 1
fi

# Override kernel update from upstream repository
dnf5 remove -y kernel-core kernel-modules kernel-modules-extra || true

echo "Installing kernel version ${KERNEL_VERSION}..."

# Install specific kernel update version
dnf5 install -y kernel-core-${KERNEL_VERSION} kernel-modules-${KERNEL_VERSION} kernel-modules-extra-${KERNEL_VERSION}

# Lock kernel update for future builds
echo "exclude=kernel* kernel-core* kernel-modules* kernel-modules-extra*" >> /etc/dnf/dnf.conf