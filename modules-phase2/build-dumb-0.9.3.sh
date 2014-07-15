#!/bin/bash

echo 'include make/unix.inc' > make/config.txt
echo 'ALL_TARGETS := core core-examples core-headers' >> make/config.txt
echo "PREFIX := $PREFIX" >> make/config.txt

make && make install

