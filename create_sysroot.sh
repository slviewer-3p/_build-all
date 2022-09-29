#!/bin/sh -x

BASE=`pwd`

test -d _results || exit 1

cd _results

test -d temp && rm -rf temp

mkdir -p temp
cd temp

date --iso-8601=seconds
sh ../packages_add.sh
date --iso-8601=seconds
autobuild installables remove zlib
date --iso-8601=seconds
autobuild install
date --iso-8601=seconds

cp $BASE/_results/packages.json sysroot/packages/
( cd sysroot/packages/ && $BASE/create_packages_info.py > packages-info.txt )

tar acf ../sysroot.tar.xz sysroot
date --iso-8601=seconds

cd ..
rm -rf temp
