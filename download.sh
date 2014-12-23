#!/bin/bash

. ./config.sh

./check_prereqs.sh

if [ ! -d $ARCHIVE_DIR ]
then
    mkdir $ARCHIVE_DIR;
fi

cd archives;
for url in `cat ../urls.list`
do
    archive=`basename $url`
    if [ ! -f $archive ]
    then
        echo "Downloading `basename $url`"
        curl --retry 5 --remote-name -L "$url" || exit 1
    fi
done

echo 'All archives downloaded'

