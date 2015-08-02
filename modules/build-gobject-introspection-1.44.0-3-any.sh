#!/bin/bash

cp -R $SOURCE_DIR/$MODULE/* $PREFIX/ || exit 1
cp $BUILD_DIR/bin/libgirepository-1.0-1.dll $BUILD_DIR/bin/libgirepository-1.0.dll || exit 1

for x in /usr/lib/girepository-1.0/*.typelib
do
    basex=$(basename $x)
    if [ ! -f $BUILD_DIR/lib/girepository-1.0/$basex ]
    then
        cp $x $BUILD_DIR/lib/girepository-1.0/ || exit 1
    fi
done

