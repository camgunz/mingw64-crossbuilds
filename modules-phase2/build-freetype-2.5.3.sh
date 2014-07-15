./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --with-zlib=yes \
            --with-png=yes \
            --with-harfbuzz=yes \
            || exit 1

make && make install

