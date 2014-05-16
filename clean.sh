#!/bin/bash

. ./config.sh

rm -rf $BUILD_DIR || exit 1
rm -rf $SOURCE_DIR || exit 1
rm -rf $ARCHIVE_DIR || exit 1
mkdir $BUILD_DIR || exit 1
mkdir $SOURCE_DIR || exit 1
mkdir $ARCHIVE_DIR || exit 1

