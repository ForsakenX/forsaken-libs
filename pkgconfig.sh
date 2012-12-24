#!/bin/bash
cd "$(dirname -- "$0")"
export PKG_CONFIG_PATH="$PWD/lib/pkgconfig"
pkg-config "$@"
