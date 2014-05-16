#!/bin/bash

rm -f win32.cache
echo 'glib_cv_long_long_format=I64' >> win32.cache
echo 'glib_cv_stack_grows=no' >> win32.cache
chmod a-w win32.cache

./configure --cache-file=win32.cache \
            --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-shared \
            --disable-static \
            --with-threads=win32 \
            --with-libiconv=gnu \
            --with-pcre=system \
            --enable-debug=no \
            --enable-modular-tests=no \
            --disable-gtk-doc || exit 1

make || exit 1
make install || exit 1

./configure --cache-file=win32.cache \
            --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --disable-shared \
            --enable-static \
            --with-threads=win32 \
            --with-libiconv=gnu \
            --with-pcre=system \
            --enable-debug=no \
            --enable-modular-tests=no \
            --disable-gtk-doc || exit 1

make || exit 1
make install || exit 1

