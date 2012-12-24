#!/bin/bash -x
cd "$(dirname -- "$0")"
# 32bit -lGL
./make.sh CC="gcc -m32" "$@" ADD_LDFLAGS+=' -L/usr/lib/i386-linux-gnu/mesa' 
