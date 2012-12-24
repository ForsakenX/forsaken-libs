#!/bin/bash -x
cd "$(dirname -- "$0")"
mkdir -p ../lib/pkgconfig 2>/dev/null
rm build.log
for b in *.build; do
	./$b >> build.log || exit 1
done
echo "Done!"
