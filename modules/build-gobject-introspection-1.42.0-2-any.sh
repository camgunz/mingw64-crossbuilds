#!/bin/bash

cp -R $SOURCE_DIR/$MODULE/* $PREFIX/ || exit 1
mv $BUILD_DIR/bin/libgirepository-1.0-1.dll $BUILD_DIR/bin/libgirepository-1.0.dll || exit 1
cp -Ru /usr/lib/girepository-1.0/*.typelib $BUILD_DIR/lib/girepository-1.0/ || exit 1

