./configure --build=$BUILD_TRIPLET \
            --host=$HOST_TRIPLET \
            --prefix=$PREFIX \
            --enable-static \
            --enable-shared || exit 1

make || exit 1
make install || exit 1
mv $PREFIX/lib/$MODULE/include/*.h $PREFIX/include

