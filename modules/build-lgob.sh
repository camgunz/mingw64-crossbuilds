#!/bin/bash

MOD_DIR="$BASE_DIR/source/$MODULE"

cp $MOD_DIR/config-mingw64.lua $MOD_DIR/config.lua || exit 1

./build.lua codegen out || exit 1
./build.lua common out || exit 1
./build.lua loader out || exit 1
./build.lua gobject out || exit 1
./build.lua cairo out || exit 1
./build.lua atk out || exit 1
./build.lua pango out || exit 1
./build.lua pangocairo out || exit 1

cp -R out/* $BUILD_DIR/ || exit 1

