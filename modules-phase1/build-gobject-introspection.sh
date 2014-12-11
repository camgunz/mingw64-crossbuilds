#!/bin/bash

if [ -x /usr/bin/python2 ]
then
    export PYTHON=/usr/bin/python2
    export PYTHON_CONFIG=/usr/bin/python2-config
fi

./autogen.sh --build=$BUILD_TRIPLET \
             --host=$HOST_TRIPLET \
             --prefix=$PREFIX \
             --enable-static \
             --enable-shared \
             || exit 1

make && make install

