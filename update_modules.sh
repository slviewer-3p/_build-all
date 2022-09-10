#!/bin/sh

git submodule init
git submodule update

cd repo

for i in *;
do
	if [ -f $i/.gitmodules ]
	then
		echo "Updating submodules for $i"
		(cd $i && git submodule init && git submodule update )
	fi
done

cd ..
