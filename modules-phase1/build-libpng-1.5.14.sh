./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared \
            || exit 1

make && make install

# Work around libpng/libtool/MinGW-w64/Code::Blocks problem on Windows

cp $BUILD_DIR/include/libpng15/* $BUILD_DIR/include/ || exit 1
rm -f $BUILD_DIR/lib/libpng.* || exit 1
cp $BUILD_DIR/lib/libpng15.a $BUILD_DIR/lib/libpng.a || exit 1
cp $BUILD_DIR/lib/libpng15.dll.a $BUILD_DIR/lib/libpng.dll.a || exit 1

