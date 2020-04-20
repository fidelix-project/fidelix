Fidelix Installation Guide
================================================================================

There are several different ways Fidelix can be installed. A few of these are
documented below.

# Installing from an Existing Fidelix Installation

This method can be used to install Fidelix from the installation images or from
an existing system.

## Mount the Installation Target Devices

Mount all of the drives and partitions that you are installing Fidelix to
under `/mnt` using the heirarchy you want for the final system.

## Installing the System Software

### Setting the SYSTEM Variable

The `SYSTEM` environment variable controls the target system type. For most
Intel/AMD based systems, the `SYSTEM` variable does not need to be set. Many
embedded systems will require this be set. If you are unsure of the value to
use, consult the documentation for your system in `./doc/systems/`.

### If your Source Tree is not in /usr/src

If your Fidelix source tree is not located at /usr/src, set the `OS_SRC_DIR`
environment variable to the root directory of your source tree.

### Installing the Base System

Once you have set any necessary variables, change to the system source
directory (`/usr/src` by default) and run:

    make SYSROOT=/mnt install

## Installing the Bootloader

All that remains is to install the bootloader. To install the default
bootloader for your system, run:

    make SYSROOT=/mnt install-bootloader

Note that many systems will require you to set additional environment variables
in order for the bootloader to be install. If your system does require that
additional variables be set, Make will inform you to set them.

Documentation for your system's bootloader can be found in
`./boot/bootloader/BOOT_LOADER`, where BOOT_LOADER is the bootloader target
for your system. The bootloader for your system can be determined by running:

    `make -C boot/bootloader which`

# Bootstrapping from an Existing Linux Distribution

This method of installation is very similar to
[Automated Linux from Scratch](http://www.linuxfromscratch.org/alfs/). It
starts by building a bootstrap system and then using that inside a chroot to
build the system. A big advantage of this method is that it allows for Fidelix
to be built and installed from a different distribution.

Documentation for this method can be found in bootstrap/tools/README.md

