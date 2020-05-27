#!/usr/bin/env sh
set -e
readonly DIR=~/Downloads
readonly MIRROR=https://github.com/vmware-tanzu/velero/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform=${os}-${arch}
    local file=velero-${ver}-${platform}.tar.gz
    local url=$MIRROR/$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver () {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver darwin amd64
    dl $ver linux amd64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver windows amd64
}


dl_ver ${1:-v1.4.0}
