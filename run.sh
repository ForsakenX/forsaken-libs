#!/bin/bash -x
cd "$(dirname -- "$0")"
libs=$PWD # path to this folder
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$libs/lib"
##
# We need this to find the libraries if not installed in /lib
# but apparently mac frameworks get unhappya bout a missing 
# libpng symbol:
#    dyld: Symbol not found: __cg_png_create_info_struct
#    Referenced from: /System/Library/Frameworks/ApplicationServices.framework/
#                     Versions/A/Frameworks/ImageIO.framework/Versions/A/ImageIO
#    Expected in: $libs/lib/libpng14.14.dylib
##
#export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$LD_LIBRARY_PATH"
## osx gdb does not support -ex
cd .. &&
gdb -x "$libs/gdb.script" --args "./projectx" "$@"
