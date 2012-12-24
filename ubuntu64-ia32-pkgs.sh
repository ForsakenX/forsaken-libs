#!/bin/bash
##
# Installs all possible required packages to build on ubuntu64
# WITHOUT needing to use the this folder...
##
# Tweak PKG_CONFIG_PATH to favor packages from your system or
# the this folder.
##
# ia32-libs which is now ia32-libs-multiarch use to provide
# libpng but apparently it's missing now.  There is also no
# 32bit version of enet or lua.
##
# Also there is no static version of openal provided.
##
sudo apt-get install \
	build-essential \
	cmake \
	ia32-libs-multiarch \
	libc6-dev-i386 \
	lib32z1-dev \
	lib32mudflap0 \
	libgl1-mesa-glx \
	libgl1-mesa-dri \
	ia32-libs \
	lib32z1-dev \
	libopenal-dev \
	libglu1-mesa-dev \

# shouldn't the linker find this automatically ?
sudo ln -sf libGL.so.1 /usr/lib/i386-linux-gnu/mesa/libGL.so
sudo ln -sf libGLU.so.1 /usr/lib/i386-linux-gnu/libGLU.so
sudo ln -sf libopenal.so.1 /usr/lib/i386-linux-gnu/libopenal.so

# this isn't even named properly
sudo ln -sf libSDL-1.2.so.0 /usr/lib/i386-linux-gnu/libSDL.so

# sdl issue
echo "You will need to remove unix/lib/libSDL* and -lSDLmain from sdl.pc"
