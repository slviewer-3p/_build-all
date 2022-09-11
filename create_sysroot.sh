#!/bin/sh

BASE=`pwd`

test -d _results || exit 1

cd _results

test -d temp && rm -rf temp

mkdir -p temp
cd temp

sh ../packages_add.sh
autobuild installables remove zlib
autobuild install

cp $BASE/_results/packages.json sysroot/packages/
( cd sysroot/packages/ && $BASE/create_packages_info.py > packages-info.txt )

tar acf ../sysroot.tar.bz2 sysroot

cd ..
rm -rf temp
