#!/bin/bash

if [ ! `which curl` ]
then
    echo "Couldn't find curl program, install curl"
    exit 1
fi

if [ ! -d archives ]
then
    mkdir archives;
fi

cd archives;
for url in `cat ../urls.list`
do
    archive=`basename $url`
    if [ ! -f $archive ]
    then
        echo "Downloading `basename $url`"
        curl --remote-name -L "$url" || exit 1
    fi
done

