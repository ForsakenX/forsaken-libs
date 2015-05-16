#!/bin/bash -x
cd "$(dirname -- "$0")"
DIR=${PWD/*\/} # path to this folder
LIB=$PWD/lib # path to lib folder
export PKG_CONFIG_PATH="$LIB/pkgconfig"
cd ..
make -e "$@" || exit 1

# on osx we need to remap the path to dynamic libs
if uname -a | grep -q Darwin; then

	osx_cli_tools_dir="/Library/Developer/CommandLineTools/usr/bin"
	export PATH="$osx_cli_tools_dir:$PATH"

	for cmd in dyldinfo install_name_tool; do
		if ! which "$cmd" &>/dev/null; then
			echo "Missing: $cmd"
			echo "Please install OSX xcode CLI tools"
			exit 1
		fi
	done

	dyldinfo -dylibs ./projectx |
	grep dylib |
	while read -r path; do
		file=${path/*\/}
		[[ -f "$LIB/$file" ]] || continue
		install_name_tool -change \
			"$path" \
			"@executable_path/$DIR/lib/$file" \
			./projectx ||
				exit 1
	done
fi

exit 0
