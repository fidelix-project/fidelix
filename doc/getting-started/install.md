Fidelix Installation Guide
==========================

This file documents how to perform a standard Fidelix installation: that is
booting from one of the bootable installation media (either .iso or .img) and
installing to a disk. If you are new to Fidelix, you may want to read through
the entire guide before beginning.

There are also several other, more advanced ways Fidelix can be installed.
These are documented in the [Alternate System Installation
Techniques](../advanced/alternate-install/README.md) section.

System Requirements
-------------------

### Minimal System Requirements

Fidelix can be installed and run with very few system resources.

* 64 MB of RAM (128 MB may be required if installing from the live iso image)
* 1.5 GB of available disk space
* Processor (depending on the architecture):
  * i686: Pentium Pro or newer.
  * x86_64: Any processor implementing the x86_64/amd64 instruction set.
  * aarch64: Any processor implementing the aarch64 instruction set.

Note that some specific single board computers and embedded devices can run
Fidelix with fewer resouces. These exceptions are documented under the [system
specifice documentation](../system-specific/README.md).

It is also possible to perform a minimal installation on substantially smaller
drives; however, doing so is an advanced topic.

### Recommended System Requirements

While Fidelix can function with the above requirements, the following specs are
recommended for the best results:

* 256 MB of RAM
* 3 GB of available disk space
* Processor: same as above

Formatting and Partitioning
---------------------------

First, the disk that Fidelix is being installed to must be partitioned and
formatted. This must be done manually. For partitioning, Fidelix provides the
following utilties:

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

On systems with larger disks (16 GB+), the following partitioning guidelines are
provided to improve system performance and security. On systems with smaller
disks, it may not be plausible to split the disk into several partitions.

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

* /: The root partition. This should be at least 2 GB in size.
* /tmp: Temporary files. Since any user/application can write here, this should
  be separate to keep the system from crashing if /tmp becomes full. This can
  be either a tmpfs or a real partition. This should be at least 512 MB in
  size.
* /home: User home directories. Recommended to be separate to keep the system
  from crashing in the event that a user writes too much data to his home
  directory.

The following additional partitions may be desirable for certain systems:

* Swap partition: a partition for swapping memory pages to in the even that
  the system runs out of physical memory.
* /srv: Service data (if you are planning on running daemons). This keeps a
  misbehaving/compromised service from filling the root partition. It will
  also be mounted with `nosuid,nodev,noexec` by default. 
* /opt: Optional data. If /opt is on a separate partition, the partition will
  be mounted with device node creation enabled. This may be necessary for
  certain third party programs that reside on /opt to function correctly. Note
  that any partition mounted under /opt will also be mounted with device node
  creation enabled.
* /var: Variable data. Traditionally, this is sometimes put on a separate
  partition. Should be at least 1 GB in size.
* /usr: User programs. Traditionally, this is sometimes put on a separate
  partition. Should be at least 1 GB in size, and will need to be several
  gigabytes in size if you are planning on building packages from source
  (either base system or pkgsrc packages).
* /usr/local: Locally installed software. Mounted with device node creation
  enabled in the same manner as /opt.
* /usr/pkg: Third party programs installed via pkgsrc. This can grow quite
  large if a lot of third party packages are installed, so it may be desirable
  to put it on a separate partition.

### Important Note for GPT Disks

**Note:** if you are installing to a GPT formatted disk and plan to use legacy
boot (currently the default on all systems), make sure you also create a BIOS
Boot Partition with partition type `EF02`. Otherwise, the bootloader
installation will fail.

Mounting the Target Filesystem
------------------------------

Mount all of the drives and partitions that you are installing Fidelix to
under `/mnt` using the heirarchy you want for the final system. You will need
to create the mountpoints for additional partitions manually.

Installing the System Software
------------------------------

### Setting the SYSTEM Variable

The `SYSTEM` environment variable controls the target system type. For most
Intel/AMD based systems, the `SYSTEM` variable does not need to be set. Many
embedded systems will require this be set. If you are unsure of the value to
use, consult the [documentation for your system](../system-specific/README.md).

### Installing the Base System

Once you have set system variables, change to the system source directory
(`/usr/src`) and use the following command to install the system software:

    make SYSROOT=/mnt install

This will install the kernel and the entire userspace for the Fidelix base
system.

Installing the Bootloader
-------------------------

All that remains is to install the bootloader. To install the default
bootloader for your system, run:

    make SYSROOT=/mnt install-bootloader

Note that many systems will require you to set additional environment variables
in order for the bootloader to be installed. If your system does require that
additional variables be set, Make will inform you to set them.

Documentation for your system's bootloader can be found in the
`boot/bootloader/BOOT_LOADER` directory, where BOOT_LOADER is the bootloader
target for your system. The bootloader for your system can be determined by
running:

    make -C boot/bootloader which

### Documentation for Common Bootloaders
For convenience, here are links to the documentation for some common
bootloaders:

* [Grub PC](../../boot/bootloader/grub-pc/README.md) (the default on i686 and
  x86_64 systems)
* [Grub Live USB](../../boot/bootloader/grub-liveusb/README.md) (live USB flash
  drive for i686 and x86_64)

Installing the System Source Code
---------------------------------

This step is optional. If you wish to install the source code for the operating
system to /usr/src, run the following:

    make SYSROOT=/mnt copy-src

### Installing the Source Code Later

If you choose not to install the source code, it can always be installed later
or downloaded from [the website](https://fidelix.us). To do this, download the
source tarball for the version of Fidelix you are running and extract it to
`/usr/src`:

    cd
    wget https://github.com/fidelix-project/fidelix//archive/0.2.0.tar.gz
    cd /usr
    tar xzf ~/0.2.0.tar.gz
    mv fidelix-0.2.0 src

Alternatively, you can copy the `/usr/src` directory from the installation
medium to `/usr` (this command assumes the installation medium is mounted at
/mnt):

    cp /mnt/usr/src /usr

Umount and Reboot
-----------------

Installation is now complete. Unmount all of the partitions under /mnt and then
reboot into your new system.

Initial System Configuration
----------------------------

After booting into your system, you can optionally perform the initial system
configuration (setting the root password, enabling the default services, etc)
by running:

    sysconfig initial

After performing the configuration it will be necessary to reboot your system
a final time for the configuration to take full effect.

