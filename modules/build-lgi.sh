#!/bin/bash

export DESTDIR="$PREFIX"
export PREFIX=""
export LUA_VERSION="5.2"
export LUA_DLL="${BUILD_DIR}/bin/lua52.dll"
export CFLAGS="$CFLAGS $(pkg-config gobject-introspection-1.0 --cflags)"
export CFLAGS="$CFLAGS -I${BUILD_DIR}/include/gobject-introspection-1.0"
export LDFLAGS="$LDFLAGS $(pkg-config gobject-introspection-1.0 --libs)"
# export LDFLAGS="$LDFLAGS -L${BUILD_DIR}/bin"

make || exit 1
make install || exit 1

