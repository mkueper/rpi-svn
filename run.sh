#!/bin/bash
#
if [ ! "$1" = "" ]; then
    echo -e "\ncreating container $1\n\n" 
    #docker run -d -p 3690:3690 -v /docker/svn-repos:/var/svn --name $1 mkueper/rpi-svn
else
    echo -e "\nUSAGE: run.sh your-container-name\n\n"
fi

