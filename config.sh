export BIN_DIR="/usr/bin"
export BUILD_TRIPLET="x86_64-pc-linux-gnu"
export HOST_TRIPLET="i686-w64-mingw32"
export HOST_PREFIX="/usr/$HOST_TRIPLET"

export BASE_DIR=`pwd`
export BUILD_DIR=$BASE_DIR/build
export SOURCE_DIR=$BASE_DIR/source
export ARCHIVE_DIR=$BASE_DIR/archives
export PATCH_DIR=$BASE_DIR/patches
export MODULES_DIR=$BASE_DIR/modules

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
export RC="$BIN_DIR/$HOST_TRIPLET-windres"
export WINDRES="$BIN_DIR/$HOST_TRIPLET-windres"

export PREFIX=$BUILD_DIR
# export LUA_INCLUDE_DIR="$HOST_PREFIX/include/lua5.1"
export CFLAGS="-I$HOST_PREFIX/include -I$PREFIX/include -I${HOST_PREFIX}/include/glib-2.0"
export CPPFLAGS="-I$HOST_PREFIX/include -I$PREFIX/include -I${HOST_PREFIX}/include/glib-2.0"
export CXXFLAGS="-I$PREFIX/include -I${HOST_PREFIX}/include/glib-2.0"
export LDFLAGS="-L$PREFIX/bin -L$PREFIX/lib -L$HOST_PREFIX/bin -L$HOST_PREFIX/lib"
export PATH="$PREFIX/bin":$PATH
export PKG_CONFIG_PATH="$HOST_PREFIX/lib/pkgconfig:$PREFIX/lib/pkgconfig"
# export PKG_CONFIG_LIBDIR="$PREFIX/lib/pkgconfig"
# export PKG_CONFIG_SYSROOT_DIR="$PREFIX"

export PACKAGE_TARNAME="mingw64-builds.tar"
export PACKAGE_FILENAME="mingw64-builds.tar.xz"

