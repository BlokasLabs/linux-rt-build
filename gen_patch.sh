#!/bin/sh

echo KVER = $KVER
echo GIT_HASH = $GIT_HASH

# Generate rpi.patch
mkdir -p debian/patches-rpi-rt/
(
  cd ../linux
  mkdir -p ../patches/
  git diff "v$KVER..$GIT_HASH"
) > debian/patches-rpi-rt/rpi.patch
#echo rpi.patch > debian/patches-rpi-rt/series
