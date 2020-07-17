Installing Fidelix from the Rootfs Tarballs
===========================================

This installation method can be used to create a chroot or a container or
to install to an existing partition (the bootloader and kernel will need to be
configured separately) from the rootfs.tar.gz and minirootfs.tar.gz images.

Note about Extracting
---------------------

In order for the root filesystem to be created with proper permissions,
attributes, and capabilities this archive must be extracted with a tar
implementation that supports xattrs and capabilities. BSD tar supports these;
GNU tar and BusyBox tar do not. On Fidelix, BSD tar can be found at
/usr/src/util/bsdtar. On most other Linux distributions the bsdtar package can
be installed from the standard repositories.

Extract the Root Filesystem
---------------------------

Navigate to the directory that you want to be the root of the filesystem. Then
extract the tarball:

    bsdtar xf fidelix-0.2.0-x86_64-build20b-rootfs.tar.gz

Entering the new System
-----------------------

At this point, the new system root will be ready for usage; it is safe to boot
to it/start the container/enter the chroot.

If choosing to chroot, the following command sequence is known to work well:

    chroot .
    /etc/rc.d/rc

