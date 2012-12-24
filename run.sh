#!/bin/bash -x
cd "$(dirname -- "$0")"
unix=$PWD # path to this folder
px=$unix/.. # path to px src folder
skel=${SKELETON:-$px/../skeleton} # path to px src folder
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$unix/lib"
##
# We need this to find the libraries if not installed in /lib
# but apparently mac frameworks get unhappya bout a missing 
# libpng symbol:
#    dyld: Symbol not found: __cg_png_create_info_struct
#    Referenced from: /System/Library/Frameworks/ApplicationServices.framework/
#                     Versions/A/Frameworks/ImageIO.framework/Versions/A/ImageIO
#    Expected in: $unix/lib/libpng14.14.dylib
##
#export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$LD_LIBRARY_PATH"
## osx gdb does not support -ex
gdb -x "$unix/gdb.script" --args \
	"$px/projectx" "$@" -chdir "$skel"
