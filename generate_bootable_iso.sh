#!/bin/sh

set -ex

PROFILE=${1:?"Give profile: standard or extended"}
ARCH=${2:?"Give the arch"}

(cd scripts && cp APKBUILD.$ARCH APKBUILD && docker build -t bootable-frozenkrill-$ARCH .)

docker run -v $(pwd)/iso_output:/iso_output -t bootable-frozenkrill-$ARCH:latest su - build -c "/build_iso.sh /iso_output $PROFILE $ARCH"