#!/bin/bash

. ./config.sh

rm -rf $BUILD_DIR || exit 1
rm -rf $SOURCE_DIR || exit 1
rm -rf $ARCHIVE_DIR || exit 1
mkdir $BUILD_DIR || exit 1
mkdir $SOURCE_DIR || exit 1
mkdir $ARCHIVE_DIR || exit 1
rm -f archives.list || exit 1
rm -f git_repos.list || exit 1
rm -f hg_repos.list || exit 1
rm -f modules.list || exit 1
rm -f urls.list || exit 1
rm -f "$PACKAGE_FILENAME" || exit 1

