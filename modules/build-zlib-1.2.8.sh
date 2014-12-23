# LDSHAREDLIBC="" \
# ./configure --prefix=$PREFIX -static || exit 1
# 
# make || exit 1
# make install || exit 1
# 
# LDSHAREDLIBC="" \
# CFLAGS="-DZLIB_DLL" \
# ./configure --prefix=$PREFIX || exit 1
CFLAGS='-D__USE_MINGW_ANSI_STDIO=1' \
make install -f win32/Makefile.gcc SHARED_MODE=1 \
                                   INCLUDE_PATH="$BUILD_DIR"/include \
                                   LIBRARY_PATH="$BUILD_DIR"/lib \
                                   BINARY_PATH="$BUILD_DIR"/bin || exit 1

