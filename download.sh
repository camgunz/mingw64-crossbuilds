#!/bin/bash

cd archives;
for url in `cat ../url_list`
do
    archive=`basename $url`
    if [ ! -f $archive ]
    then
        echo "Downloading `basename $url`"
        curl --remote-name -L "$url" || exit 1
    fi
done

