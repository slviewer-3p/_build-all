#!/bin/sh

export DISABLE_UNIT_TESTS=1
python3 3p-builder/build.py --work-dir repo --exclude cef-bin $1
