#!/bin/bash -x
cd "$(dirname -- "$0")"
export PKG_CONFIG_PATH="$PWD/lib/pkgconfig"
cd .. && make "$@"
