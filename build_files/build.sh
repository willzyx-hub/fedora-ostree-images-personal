#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install Packages needed for Personal use
dnf5 install -y tmux virt-manager sbsigntools gparted terminus-fonts terminus-fonts-console

# Ensure /opt is a directory; if /opt exists as a file, move it aside
if [ -e /opt ]; then
  if [ ! -d /opt ]; then
    echo "/opt exists but is not a directory; moving it aside"
    mv -f /opt /opt.bak
  fi
fi

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
