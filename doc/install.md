Fidelix Installation Guide
================================================================================

There are several different ways Fidelix can be installed. The most common ones
are documented below.

* [From the Installation Media or an Existing Fidelix Installation](#installing-from-the-installation-media-or-an-existing-fidelix-installation)
* [From the Rootfs Tarballs](#from-the-rootfs-tarballs)
* [Bootstrapping from an Existing Linux Distribution](#bootstrapping-from-an-existing-linux-distribution)

# Installing from the Installation Media or an Existing Fidelix Installation

This method can be used to install Fidelix from the installation media images
(.img or .iso) or from an existing system.

## Formatting and Partitioning

Partition and formatting must be done manually. For partitioning, Fidelix
provides the following utilties:

* fdisk
* gdisk
* cgdisk

For formatting the partitions, Fidelix provides the following options on the
installer:

* mkfs.ext2
* mkfs.minix
* mkfs.reiser
* mkfs.vfat

Note that Fidelix can be installed to disks formatted using many other
filesystems if the filesystem is already formatted. 

### Note on Partitioning

For security purposes, it is recommended (but not required) that you do not put
the entire system on a single partition for a couple of reasons:

* Security: some default security options (such as `nosuid`) are enabled by
  default for most partitions, but may need to be disabled for certain
  partitions in order for third party software to function properly.
* Stability: if the entire system is on one partition, one misbehaving
  unprivileged program or user can easily cause a system wide denial of service
  by filling the root partition with garbage data. If the system programs are
  on a separate parition, they are more likely to continue to function if a
  partition becomes full.

At a bare minimum, it is recommended that the following separate partitions
exist:

* /: The root partition.
* /usr/local: Locally installed third party programs. By default, this will be
  the only partition mounted with suid enabled. If it is not a separate
  partition, suid will be disabled for software on /usr/local, which may break
  some third party programs.
* /tmp: Temporary files. Since any user/application can write here, this should
  be separate to keep the system from crashing if /tmp becomes full. This can
  be either a tmpfs or a real partition.
* /home: User home directories. Recommended to be separate to keep the system
  from crashing in the event that a user writes too much data to his home
  directory.

The following additional partitions may be desirable for certain systems:

* /srv: Service data (if you are planning on running daemons). This keeps a
  misbehaving/compromised service from filling the root partition. It will
  also be mounted with `nosuid,nodev,noexec` by default. 
* /opt: Optional data. If /opt is on a separate partition, the partition will
  be mounted with suid enabled. This may be necessary for certain third party
  programs that reside on /opt to function correctly. Note that any partition
  mounted under /opt will alco be mounted with suid enabled.
* /var: Variable data. Traditionally, this is sometimes put on a separate
  partition.
* /usr: User programs. Traditionally, this is sometimes put on a separate
  partition.

**Note:** if you are installing to a GPT formatted disk and plan to use legacy
boot (currently the default on all systems), make sure you also create a BIOS
Boot Partition with partition type `EF02`. Otherwise, the bootloader
installation will fail.

## Mounting the Installation Target Devices

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

    make -C boot/bootloader which

## Install the System Source Code

This step is optional. If you wish to install the source code for the operating
system to /usr/src, run:

    make SYSROOT=/mnt copy-src

## Umount and Reboot

Installation is now complete. Unmount all of the partitions under /mnt and then
reboot into your new system.

## Initial System Configuration

After booting into your system, you can optionally perform the initial system
configuration (setting the root password, enabling the default services, etc)
by running:

    sysconfig initial

After performing the configuration it will be necessary to reboot your system
a final time for the configuration to take full effect.

# From the Rootfs Tarballs

This installation method can be used to create a chroot or a container or
install to an existing partition (bootloader and kernel will need to be
configured separately) from the rootfs.tar.gz and minirootfs.tar.gz images.

## Note about Extracting

In order for the root filesystem to be created with proper permissions,
attributes, and capabilities this archive must be extracted with a tar
implementation that supports xattrs and capabilities. BSD tar supports these;
GNU tar and BusyBox tar do not. On Fidelix, BSD tar can be found at
/usr/src/util/bsdtar. On most other Linux distributions the bsdtar package can
be installed from the standard repositories.

## Extract the Root Filesystem

Navigate to the directory that you want to be the root of the filesystem. Then
extract the tarball:

    bsdtar xf fidelix-0.2.0-x86_64-build20b-rootfs.tar.gz

## Entering the new System

At this point, the new system root will be ready for usage; it is safe to boot
to it/start the container/enter the chroot.

If choosing to chroot, the following command sequence is known to work well:

    chroot .
    /etc/rc.d/rc

# Bootstrapping from an Existing Linux Distribution

This method of installation far more advanced and is very similar to
[Automated Linux from Scratch](http://www.linuxfromscratch.org/alfs/). It
starts by building a bootstrap system and then using that inside a chroot to
build the system. A big advantage of this method is that it allows for Fidelix
to be built and installed from a different distribution.

Documentation for this method can be found in bootstrap/tools/README.md

