Fidelix Images
==============

This directory contains the Makefile for building the official Fidelix
installation images. Images are placed in the out directory.

By default, the following images are built:

# OS_NAME-OS_VERSION-OS_RELEASE_NAME-standard.img

The standard image. Contains the live system and a /usr/src directory
containting prebuilt binary packages. Useful as in installation image and/or a
live USB.

# Influential Variables

OUTDIR: The directory to place the output images in. Defaults to `~/images`.
WORKDIR: The temporary working directory. Defaults to `/tmp/images_work`.
COMP_EXT: The compression extension to use. Defaults to `bz2`.
COMP_PROG: The compression program to use. Defaults to `bzip2`.


