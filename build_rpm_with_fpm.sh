#!/bin/bash

function die(){
    REASON=${1:?An unknown error occured}
    echo $REASON
    exit 1
}

command -v fpm > /dev/null 2>&1 || die "Please install the fpm gem (https://github.com/jordansissel/fpm)"
VERSION=$(cat VERSION)

fpm -t rpm -v $VERSION --directories /var/lib/yadt-broadcaster/docroot --license GPLv3 --url https://github.com/yadt/dist-yadtbroadcaster-docroot -n dist-wamp-router-docroot -s dir src/var/lib/yadt-broadcaster/=/var/lib/yadt-broadcaster 
