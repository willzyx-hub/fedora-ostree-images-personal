#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Install Packages needed for Personal use
dnf5 install -y make cmake clang bison dbus-devel flex glibc-devel.i686 fuse-devel \
systemd-devel elfutils-libelf-devel cairo-devel freetype-devel.{x86_64,i686} \
libjpeg-turbo-devel.{x86_64,i686} fontconfig-devel.{x86_64,i686} libglvnd-devel.{x86_64,i686} \
mesa-libGL-devel.{x86_64,i686} mesa-libEGL-devel.{x86_64,i686} mesa-libGLU-devel.{x86_64,i686} \
libtiff-devel.{x86_64,i686} libxml2-devel libbsd-devel git git-lfs libXcursor-devel \
libXrandr-devel giflib-devel pulseaudio-libs-devel libxkbfile-devel \
openssl-devel llvm libcap-devel libavcodec-free-devel libavformat-free-devel