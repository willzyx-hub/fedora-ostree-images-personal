#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install Packages needed for Personal use
dnf5 install -y tmux virt-manager sbsigntools gparted terminus-fonts terminus-fonts-console

# Install Google Chrome
curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm . # Try to add . to ensure the .rpm downloaded at current directory
dnf5 install -y ./google-chrome-stable_current_x86.64.rpm

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
