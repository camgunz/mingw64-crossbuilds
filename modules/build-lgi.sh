#!/bin/bash

make PREFIX="$PREFIX" \
     LUA_VERSION=5.2 \
     || exit 1
make install || exit 1

