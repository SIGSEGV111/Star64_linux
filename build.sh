#!/bin/bash -eux
cd "$(dirname "$(readlink -f "$0")")"
make -j5 all
make -j5 modules_install
dracut --force --kver 5.15.115+ /tmp/initrd
mkimage -f star64.its /boot/efi/fitImage
