#!/bin/bash

SAVED_PKG_CONFIG_LIBDIR=$PKG_CONFIG_LIBDIR
unset -v PKG_CONFIG_LIBDIR

echo "pkg-config search path: `pkg-config --variable pc_path pkg-config`"

make || exit 1
make install || exit 1

export PKG_CONFIG_LIBDIR=$SAVED_PKG_CONFIG_LIBDIR

