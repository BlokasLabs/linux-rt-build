#!/bin/sh

echo patch.sh is deprecated and not used.
exit 0

fakeroot sh -c '
  mkdir tmp
  dpkg-deb -R "$1" tmp
  echo "Pre-Depends: blokas-initrd-rt" >> tmp/DEBIAN/control
  echo "Conflicts: $2" >> tmp/DEBIAN/control
  dpkg-deb -b tmp "$3"
  rm -rf tmp
' --  $1 $2 $3
