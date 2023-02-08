#!/bin/sh

set -ex

OUT_DIR=${1:?"Give output dir"}
PROFILE=${2:?"Give profile: standard or extended"}
ARCH=${3:?"Provide the arch"}
mkdir -p /home/build/packages/testing

cd /aports/testing/frozenkrill
# abuild checksum
cat APKBUILD
abuild -r

sudo sh /aports/scripts/mkimage.sh --tag edge --outdir $OUT_DIR --arch $ARCH --repository http://dl-cdn.alpinelinux.org/alpine/edge/main --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing --repository http://dl-cdn.alpinelinux.org/alpine/edge/community --repository /home/build/packages/testing --profile frozenkrill_$PROFILE