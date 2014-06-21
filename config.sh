export VALID_TOOLCHAINS="glibc"
export NACL_SDK_ROOT="$HOME/code/nacl_sdk/pepper_35"
export BUILD_TRIPLET="x86_64-pc-linux-gnu"
export HOST_TRIPLET="x86_64-nacl"

export BIN_DIR="$NACL_SDK_ROOT/toolchain/linux_x86_glibc/bin"
export HOST_PREFIX="$NACL_SDK_ROOT/toolchain/linux_x86_glibc/$HOST_TRIPLET"
export CMAKE_SYSTEM_NAME="Linux"
export TOOLCHAIN_FILE="nacl-toolchain.cmake"

export BASE_DIR=`pwd`
export BUILD_DIR=$BASE_DIR/build
export SOURCE_DIR=$BASE_DIR/source
export ARCHIVE_DIR=$BASE_DIR/archives

export AR="$BIN_DIR/$HOST_TRIPLET-ar"
export CC="$BIN_DIR/$HOST_TRIPLET-gcc"
export CXX="$BIN_DIR/$HOST_TRIPLET-g++"
export DLLTOOL="$BIN_DIR/$HOST_TRIPLET-dlltool"
export LD="$BIN_DIR/$HOST_TRIPLET-ld"
export NM="$BIN_DIR/$HOST_TRIPLET-nm"
export OBJCOPY="$BIN_DIR/$HOST_TRIPLET-objcopy"
export OBJDUMP="$BIN_DIR/$HOST_TRIPLET-objdump"
export RANLIB="$BIN_DIR/$HOST_TRIPLET-ranlib"
export STRIP="$BIN_DIR/$HOST_TRIPLET-strip"
# export WINDRES="$BIN_DIR/$HOST_TRIPLET-windres"

export PREFIX=$BUILD_DIR
export CPPFLAGS="-I$HOST_PREFIX/include -I$PREFIX/include"
export CFLAGS="-I$HOST_PREFIX/include -I$PREFIX/include"
export CXXFLAGS="-I$HOST_PREFIX/include -I$PREFIX/include"
export LDFLAGS="-L$HOST_PREFIX/lib -L$PREFIX/lib"
export LD_LIBRARY_PATH="$HOST_PREFIX/lib /usr/lib"
export PATH="$PREFIX/bin":$PATH
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_LIBDIR="$PREFIX/lib/pkgconfig"

