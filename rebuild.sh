#!/bin/sh

set -e

./clean.sh
./download.sh
./unpack.sh
./build.sh

