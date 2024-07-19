#!/bin/bash -x
cd "$(dirname -- "$0")"
mkdir -p ../lib/pkgconfig 2>/dev/null
rm build.log
set -e # die if any of the following fail
# pass --rebuild if you want to rebuild everything
rebuild=false; [[ $* =~ --rebuild ]] && rebuild=true
function run
{
	if ! $rebuild && [[ -f ${1}.built ]]; then
		echo "rm ${1}.built if you want to rebuild."
		return 0
	fi
	"$@" || return 1
	touch ${1}.built
}
{

	# these must generally be built in this order
	run ./zlib-1.2.13.build
	run ./libpng-1.4.4.build
	run ./lua-5.1.5.build
	run ./luasocket-2.0.2.build

	# these are independent
	run ./enet-1.2.5.build
	run ./SDL-1.2.build.latest
	run ./openal-soft-1.14.build

} 2>&1 | tee build.log
if [[ ${PIPESTATUS[0]} != 0 ]]; then
	echo "Failed to build..."
	exit 1
fi
echo "Done!"
