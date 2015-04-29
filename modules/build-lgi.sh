#!/bin/bash

export PREFIX="$PREFIX"
export LUA_VERSION="5.2"

make || exit 1
make install || exit 1

