#!/bin/sh

BASEDIR=$(dirname $(readlink -f "$0"))

DEB_RULES_REQUIRES_ROOT=no make -f debian/rules.gen binary-indep_rpi-rt_real

for flavour in v6 v7 v7l; do
	${BASEDIR}/build.sh armhf ${flavour}
done

for flavour in v8 2712; do
	${BASEDIR}/build.sh arm64 ${flavour}
done
