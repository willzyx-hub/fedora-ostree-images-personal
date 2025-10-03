#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install Packages needed for Personal use
dnf5 install -y tmux virt-manager sbsigntools gparted terminus-fonts terminus-fonts-console

# Ensure /opt/google is free and not occupied.
if [ -e /opt/google ]; then
  if [ ! -d /opt/google ]; then
    echo "/opt/google exists and is not a directory; backing it up" # Check to make sure /opt/google isn't a file otherwise the installation will fail.
    mv -f /opt/google /opt/google.bak
  fi
fi
mkdir -p /opt/google

# Install Google Chrome
wget -O /tmp/google-chrome-stable_current_x86_64.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm # Try using absolute path
dnf5 install -y /tmp/google-chrome-stable_current_x86_64.rpm

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
