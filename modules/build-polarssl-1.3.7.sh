build_toolchain_file $TOOLCHAIN_FILE

cmake . -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$PREFIX \
                           -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE \
                           || exit 1

make || exit 1
make install

