LDSHAREDLIBC="" \
./configure --prefix=$PREFIX -static || exit 1

make || exit 1
make install || exit 1

LDSHAREDLIBC="" \
./configure --prefix=$PREFIX || exit 1

make || exit 1
make install || exit 1

