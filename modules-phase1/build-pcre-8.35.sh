./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            --enable-unicode-properties \
            || exit 1

make && make install

