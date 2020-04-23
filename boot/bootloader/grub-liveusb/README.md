grub-liveusb
============

# Synopsis

The grub-liveusb bootloader target installs the legacy BIOS version of GRUB and
configures Linux to boot from a USB flash drive or an SD card without an
initramfs.

# Description

This tarets works by copying the GRUB files over to `$SYSROOT/boot/grub`,
creating a new `$SYSROOT/boot/grub/grub.cfg`, and (optionally) installing GRUB
to the MBR. The last part can be controlled by the `INSTALL_MBR` environment
variable.

If a grub.cfg already exists in `$SYSROOT/boot/grub`, it will be saved as
`$SYSROOT/boot/grub/grub.cfg.old`. The `grub.cfg` make target can be used to
generate a suitable grub.cfg without installing it (this can be useful for
generating GRUB commands to use with an existing GRUB installation). This part
is controlled by the `INSTALL_GRUBCFG` environment variable.

# Influential Variables

There are several enviroment variables that will affect the bootloader
installation if set:

* `GRUB_DRIVE`: The device node to install GRUB to (usually /dev/sda). Must be
  set.
* `INSTALL_MBR`: Whether or not to install the MBR. Can be set to y/n. If not
  set, defaults to y.
* `INSTALL_GRUBCFG`: Whether or not to install the new grub.cfg. Can be set to
  y/n. If not set, defaults to y.
* `SYSROOT`: The root directory of the system to install to.
* `SERIAL_CONSOLE`: If set, use this serial port as a console in addition to
  tty1. Set to the basename of the console (i.e. ttyS0).
* `GRUB_COMMANDS`: Additional GRUB commands to run on boot.
* `KERNEL_ARGS`: Additional arguments to pass to the kernel command line.
* `OS_NAME`: The operating system name to display on the boot menu.
* `OS_VERSION`: The operating system version to display on the boot menu.

# Known Issues

## Your core.img is too Large

In order for the live USB image to be bootable on some platforms, modules must
be built in to GRUB's core.img that would usually not be. This causes core.img
to be larger than it usually would be and can cause an error if the area on the
disk reserved for embedding the bootloader is not large enougn.

To fix this error, do one of the following:
* For MBR partitioned disks, leave at least 512 KB (1024 sectors) before the
  start of the first partition.
* For GPT partitioned disks, make sure there is a BIOS boot partition on the
  disk that is at least 512 KB in size.

