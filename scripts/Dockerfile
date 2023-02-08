FROM alpine:latest
RUN apk update
RUN apk add alpine-sdk build-base apk-tools alpine-conf busybox fakeroot syslinux xorriso squashfs-tools sudo
RUN apk add mtools dosfstools grub-efi
RUN git clone --depth=1 https://gitlab.alpinelinux.org/alpine/aports.git
RUN abuild-keygen -nia
RUN adduser build -G abuild --disabled-password && echo "%abuild ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/abuild
RUN su - build -c "abuild-keygen -nia"
COPY mkimage.frozenkrill_standard.sh aports/scripts/mkimg.frozenkrill_standard.sh
COPY mkimage.frozenkrill_extended.sh aports/scripts/mkimg.frozenkrill_extended.sh
COPY build_iso.sh .
RUN mkdir -p aports/testing/frozenkrill/src
COPY APKBUILD aports/testing/frozenkrill
RUN chown -R build: aports/testing/frozenkrill