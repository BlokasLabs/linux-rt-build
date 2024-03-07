#!/bin/sh

echo patch_all.sh is deprecated and not used.
exit 0

VERSION=$1

for flavour in v6 v7 v7l; do
	./patch_control.sh orig/linux-image-6.1.0-rpi8-rpi-rt-${flavour}_${VERSION}_armhf.deb linux-image-6.1.0-rpi8-rpi-${flavour} linux-image-6.1.0-rpi8-rpi-rt-${flavour}_${VERSION}_armhf.deb
done

for flavour in v8 2712; do
	./patch_control.sh orig/linux-image-6.1.0-rpi8-rpi-rt-${flavour}_${VERSION}_arm64.deb linux-image-6.1.0-rpi8-rpi-${flavour} linux-image-6.1.0-rpi8-rpi-rt-${flavour}_${VERSION}_arm64.deb
done
