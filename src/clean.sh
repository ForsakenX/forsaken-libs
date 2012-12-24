#!/bin/bash
cd "$(dirname -- "$0")"
dirs=$(find . -iname 'makefile' -exec dirname {} \;)
for d in $dirs; do ( cd $d; make clean; ); done
