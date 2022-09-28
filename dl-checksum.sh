#!/usr/bin/env bash
set -e
readonly DIR=~/Downloads
readonly MIRROR=https://github.com/vmware-tanzu/velero/releases/download

# https://github.com/vmware-tanzu/velero/releases/download/v1.4.2/CHECKSUM

dl()
{
    local lchecksum=$1
    local ver=$2
    local os=$3
    local arch=$4
    local platform=${os}-${arch}
    local file=velero-${ver}-${platform}.tar.gz
    local url=$MIRROR/$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksum | awk '{print $1}')
}

dl_ver () {
    local ver=$1
    local checksum_url=${MIRROR}/${ver}/CHECKSUM
    printf "  # %s\n" $checksum_url
    local lchecksum=$DIR/velero-${ver}-checksums.txt

    if [ ! -e $lchecksum ];
    then
        curl -sSLf -o $lchecksum $checksum_url
    fi

    printf "  %s:\n" $ver
    dl $lchecksum $ver darwin amd64
    dl $lchecksum $ver linux amd64
    dl $lchecksum $ver linux arm
    dl $lchecksum $ver linux arm64
    dl $lchecksum $ver windows amd64
}

dl_ver ${1:-v1.9.2}
