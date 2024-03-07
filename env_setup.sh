#!/bin/sh
# Set up envvars

if [ -z "$1" ]; then
  GIT_HASH="$(curl -Ss https://raw.githubusercontent.com/raspberrypi/firmware/stable/extra/git_hash)"
else
  GIT_HASH="$(cd linux && git rev-parse "$1")"
fi

KVER=$(
  cd linux
  MAKEFILE_HEAD=$(git show "${GIT_HASH}:Makefile" | head)
  VERSION=$(echo "$MAKEFILE_HEAD" | sed -n 's/^VERSION = \(.*\)$/\1/p')
  PATCHLEVEL=$(echo "$MAKEFILE_HEAD" | sed -n 's/^PATCHLEVEL = \(.*\)$/\1/p')
  SUBLEVEL=$(echo "$MAKEFILE_HEAD" | sed -n 's/^SUBLEVEL = \(.*\)$/\1/p')
  echo "$VERSION.$PATCHLEVEL.$SUBLEVEL"
)

# Get orig tarball

if ! [ -f "linux_$KVER.orig.tar.xz" ]; then
  wget "https://cdn.kernel.org/pub/linux/kernel/v$(echo "$KVER" | cut -f1 -d.).x/linux-${KVER}.tar.xz" -O "linux_$KVER.orig.tar.xz"
fi

export KVER
export GIT_HASH
