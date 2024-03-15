#!/bin/sh

echo patch.sh is deprecated and not used.
exit 0

fakeroot sh -c '
  mkdir tmp
  dpkg-deb -R "$1" tmp
  sed -i "s/^\(Depends:.*\)/\\1, blokas-initrd-rt \(>= 1.0.0-1\)/" tmp/DEBIAN/control
  dpkg-deb -b tmp "$3"
  rm -rf tmp
' --  $1 $2 $3
