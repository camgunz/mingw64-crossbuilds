#!/bin/sh

CFLAGS="$CFLAGS -DCURL_STATICLIB"
./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --enable-ares=$PREFIX \
            --enable-ipv6 \
            --with-winidn \
            --disable-threaded-resolver \
            --with-polarssl=$PREFIX \
            || exit 1

make && make install

