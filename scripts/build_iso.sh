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

# Run mkimage.sh as the build user, not root: apk-tools 3 rejects the
# --no-chown flag it passes (now an alias of --usermode) when run as root.
# As the build user it trusts the key from ~/.abuild/abuild.conf, the one
# that signed the local repository above, so our package stays
# signature-verified in the image.
ISO_DIR=/home/build/iso
mkdir -p $ISO_DIR
sh /aports/scripts/mkimage.sh \
	--tag edge --outdir $ISO_DIR --arch $ARCH \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
	--repository /home/build/packages/testing \
	--profile frozenkrill_$PROFILE

# The output volume is created by docker and owned by root
sudo cp $ISO_DIR/* $OUT_DIR/