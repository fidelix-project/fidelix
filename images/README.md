Fidelix Images
==============

This directory contains the Makefile for building the official Fidelix
installation images. Images are placed in the ~/images directory.

Image Formats
=============

By default, the following images are built:

OS_NAME-OS_VERSION-OS_RELEASE_NAME.img
--------------------------------------

The standard image. Contains the live system and a /usr/src directory
containting prebuilt binary packages. Useful as an installation image and/or a
live USB image. Can also be dd-ed directly to a destination drive.

OS_NAME-OS_VERSION-OS_RELEASE_NAME.iso
--------------------------------------

The CD ISO image.

Influential Variables
=====================

OUTDIR: The directory to place the output images in. Defaults to `~/images`.
WORKDIR: The temporary working directory. Defaults to `/tmp/images_work`.
COMP_EXT: The compression extension to use. Defaults to `bz2`.
COMP_PROG: The compression program to use. Defaults to `bzip2`.

