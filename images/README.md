Fidelix Images
==============

This directory contains the Makefile for building the official Fidelix
installation images. Images are placed in the ~/images directory.

Image Formats
=============

By default, the following images are built (the corresponding Make targets are
in parenthesis):

Full Disk Image (img)
---------------------

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME.img.gz

The standard image. Contains the live system, a /usr/src directory, and a
/var/packages directory containing prebuilt binary packages. Useful as an
installation image and/or a live USB image. Can also be dd-ed directly to a
destination drive.

CD Image (iso)
--------------

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME.iso

The bootable ISO9660 CD-ROM image containing a minimal system image, the source
tree, and the binary packages. It can be written to a DVD and used as both a
live CD and an installer.

Source Archive (src)
--------------------

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME-src.tar.gz

A tar archive containing the system source tree, suitable for extracting to
/usr.

Packages Archive (pkgs)
-----------------------

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME-pkgs.tar.gz

A tar archive containing the binary packages, suitable for extracting to /var.

Root Filesystem (rootfs)
========================

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME-rootfs.tar.gz

A tar archive containing a complete root filesystem (but no kernel or
bootloader). Useful for chroot environments or installing to systems that
already have a bootloader and kernel (such as embedded platforms).

**IMPORTANT:** in order for the root filesystem to be created with proper
permissions, attributes, and capabilities this archive must be extracted with a
tar implementation that supports xattrs and capabilities. BSD tar supports
these and can be found in /usr/src/util/bsdtar; GNU tar and BusyBox tar do not.

Minimal Root Filesystem (minirootfs)
====================================

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME-minirootfs.tar.gz

A tar archive containing a minimal root filesystem (only essential packages; no
kernel or bootloader). Useful for small chroot environments and containers.
Also useful for installing to systems that already have a bootloader and kernel
and have limited disk space (such as embedded platforms). Supports installing
binary packages, but not building from source.

**IMPORTANT:** in order for the root filesystem to be created with proper
permissions, attributes, and capabilities this archive must be extracted with a
tar implementation that supports xattrs and capabilities. BSD tar supports
these and can be found in /usr/src/util/bsdtar; GNU tar and BusyBox tar do not.

Influential Variables
=====================

OUTDIR: The directory to place the output images in. Defaults to `~/images`.
WORKDIR: The temporary working directory. Defaults to `/tmp/images_work`.
COMP_EXT: The compression extension to use. Defaults to `bz2`.
COMP_PROG: The compression program to use. Defaults to `bzip2`.

