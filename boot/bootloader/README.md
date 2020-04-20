Bootloader README
=================

# Overview

This directory contains several subdirectories, each for installing a different
bootloader configuration. The exact bootloader target required varies depending
on the system type, hardware configuration, and boot configuration. A default
`BOOT_LOADER` value is defined for each system type (see
/usr/src/include/system). For most systems, using the default should be
sufficient. To install the default bootloader, use the following command:

    cd /usr/src/boot/bootloader && make install

Or alternatively:

    cd /usr/src && make install-bootloader

# Picking a Bootloader

Each bootloader has a detailed README in its subdirectory explaining its
use cases and usage. For convenience, here is a list with a brief description
of each bootloader.

* grub-pc: boot using Grub off of a hard drive (SCSI, IDE, SATA, or NVME).
* grub-liveusb: boot using Grub off of a USB flash drive (useful for live USB
  images). The resulting bootloader is portable and can be used to boot on
  other systems.

