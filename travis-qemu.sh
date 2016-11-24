#!/bin/bash
set -e

VERSION=${QEMU_VERSION:=2.7.0}
ARCHES=${QEMU_ARCHES:=arm aarch64 i386 x86_64}

TARGETS=$(echo $ARCHES | sed 's#$# #;s#\W#-softmmu #g')

echo "VERSION: $VERSION"
echo "TARGETS: $TARGETS"

rm -rf qemu "qemu-$VERSION"

# Checking for a tarball before downloading makes testing easier :-)
test -f "qemu-$VERSION.tar.bz2" || wget "http://wiki.qemu-project.org/download/qemu-$VERSION.tar.bz2"
tar -xf "qemu-$VERSION.tar.bz2"
cd "qemu-$VERSION"

./configure \
  --prefix="$HOME/qemu" \
  --target-list="$TARGETS" \
  --disable-docs

make -j4
make install
