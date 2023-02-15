# bootable frozenkrill
These are a set of scripts that create a very lean [Alpine Linux](https://www.alpinelinux.org/) ISO file with the [frozenkrill](https://github.com/planktonlabs/frozenkrill) package available for offline installation.

[Alpine Linux](https://www.alpinelinux.org/) is a small, simple and secure Linux distribution that perfectly matches the minimalist philosophy of [frozenkrill](https://github.com/planktonlabs/frozenkrill).

There are pre created ISO files using GitHub Actions on [Releases](https://github.com/planktonlabs/bootable-frozenkrill/releases)

## Installation

Either download the ISO on [Releases page](https://github.com/planktonlabs/bootable-frozenkrill/releases) or see below how to build from scratch


## Building from scratch
You just need Linux and [Docker](https://docs.docker.com/desktop/install/linux-install/)

Then run:

```shell
$ ./generate_bootable_iso.sh extended x86_64
```

If everything goes fine, it will generate a `iso_output/alpine-frozenkrill_extended-edge-x86_64.iso`

The ISO can also be locally tested with QEMU, like:
```shell
$ qemu-system-x86_64 -m 512 -cdrom iso_output/alpine-frozenkrill_extended-edge-x86_64.iso
```

# Booting up

The ISO can be written to a usb stick using an appropriate tool like [unetbootin](https://unetbootin.github.io/)

Just boot the usb stick and when the prompt login appears, type `root` and press enter (there is no password)

Before anything, do a sanity check on the entropy source with:
```shell
$ apk add rng-tools
$ rngtest -c 1000 < /dev/random
```
It should run fast and generate a failure rate much smaller than 1%

Note: this doesn't guarantee that the system's entropy is perfect or even good, it just makes sure it isn't complete garbage

Then run:
```shell
$ apk add frozenkrill
```

Now the `frozenkrill` command is available, test it with:
```shell
$ frozenkrill --help
```

Then proceed according to the [official documentation](https://github.com/planktonlabs/frozenkrill#quick-start-in-interactive-mode)