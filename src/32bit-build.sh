#!/bin/bash
cd "$(dirname -- "$0")"
# note that luasocket does not use `make -e` otherwise
# it would override the .config file definitions for
# [CL]FLAGS .. But .config file comments out CC so
# that CC= environment variable catches it
export CC="gcc -m32" # for all ./configure builds
export CFLAGS='-m32' LDFLAGS='-m32' # for cmake in openal
./build.sh "$@"
