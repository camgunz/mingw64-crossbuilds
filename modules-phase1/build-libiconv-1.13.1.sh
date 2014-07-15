#!/bin/sh

./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-relocatable \
            --enable-static \
            --enable-shared \
            || exit 1

make && make install

