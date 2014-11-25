./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            || exit 1

make && make install

# Work around libpng/libtool/MinGW-w64/Code::Blocks problem on Windows

cp $PREFIX/include/libpng15/* $PREFIX/include/ || exit 1
rm -f $PREFIX/lib/libpng.* || exit 1
cp $PREFIX/lib/libpng15.a $PREFIX/lib/libpng.a || exit 1
cp $PREFIX/lib/libpng15.dll.a $PREFIX/lib/libpng.dll.a || exit 1

