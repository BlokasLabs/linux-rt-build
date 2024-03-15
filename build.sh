#!/bin/sh

set -e

# Based on https://wiki.debian.org/HowToCrossBuildAnOfficialDebianKernelPackage
ARCH=$1
FEATURESET=rpi-rt
FLAVOUR=$2

export $(dpkg-architecture -a$ARCH)
export PATH=/usr/lib/ccache:$PATH
export DEB_BUILD_PROFILES="cross nopython nodoc pkg.linux.notools"
export MAKEFLAGS="-j$(($(nproc)*2))"

fakeroot make -f debian/rules clean
fakeroot make -f debian/rules orig
fakeroot make -f debian/rules source
fakeroot make -f debian/rules.gen setup_${ARCH}_${FEATURESET}_${FLAVOUR}
fakeroot make -f debian/rules.gen binary-arch_${ARCH}_${FEATURESET}_${FLAVOUR}

#binary-arch_arm64_real_kbuild
