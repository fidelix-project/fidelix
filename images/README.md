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

The standard image. Contains the live system and a /usr/src directory
containing prebuilt binary packages. Useful as an installation image and/or a
live USB image. Can also be dd-ed directly to a destination drive.

CD Image (iso)
--------------

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME.iso

The bootable ISO9660 CD-ROM image containing a minimal system image, the source
tree, and the binary packages. They can be written to a DVD and used as both a
live CD and an installer.

Source Archive (src)
--------------------

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME-src.tar.gz

A tar archive containing the system source tree.

Packages Archive (pkgs)
-----------------------

File name: OS_NAME-OS_VERSION-OS_RELEASE_NAME-pkgs.tar.gz

A tar archive containing the binary packages.

Influential Variables
=====================

OUTDIR: The directory to place the output images in. Defaults to `~/images`.
WORKDIR: The temporary working directory. Defaults to `/tmp/images_work`.
COMP_EXT: The compression extension to use. Defaults to `bz2`.
COMP_PROG: The compression program to use. Defaults to `bzip2`.

