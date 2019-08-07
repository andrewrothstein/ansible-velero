#!/usr/bin/env sh
VER=v1.0.0
DIR=~/Downloads
MIRROR=https://github.com/heptio/velero/releases/download/${VER}

dl()
{
    OS=$1
    ARCH=$2
    PLATFORM=${OS}-${ARCH}
    FILE=velero-${VER}-${PLATFORM}.tar.gz
    URL=$MIRROR/$FILE
    LFILE=$DIR/$FILE

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $PLATFORM `sha256sum $LFILE | awk '{print $1}'`
}

printf "  %s:\n" $VER
dl darwin amd64
dl linux amd64
dl linux arm
dl linux arm64
dl windows amd64


