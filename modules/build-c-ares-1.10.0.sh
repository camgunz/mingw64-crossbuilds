#!/bin/sh

CFLAGS="" \
./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-shared \
            --enable-static \
            --enable-nonblocking \
            || exit 1

make && make install

