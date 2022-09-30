#!/bin/sh -x

BASE=`pwd`

test -d _results || exit 1

cd _results

test -d temp && rm -rf temp

mkdir -p temp
cd temp

GLIBC_VERSION=$(python -c 'import platform; print( "-".join(platform.libc_ver()) )')

sh ../packages_add.sh
autobuild installables remove zlib
autobuild install

cp $BASE/_results/packages.json sysroot/packages/
( cd sysroot/packages/ && $BASE/create_packages_info.py > packages-info.txt )

tar acf ../sysroot-${GLIBC_VERSION}.tar.xz sysroot
date --iso-8601=seconds

cd ..
rm -rf temp
