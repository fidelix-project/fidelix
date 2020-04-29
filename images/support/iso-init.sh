#!/bin/sh

# This is the init script for the ISO images. It mounts an overlayfs, with a
# writiable ramdisk at /rw and the underlying CDROM root fs at /ro. Until a
# proper writable rootfs is mounted, all the system binaries are at /ro/bin and
# /ro/sbin, hence the weird path.

# Mount the kernel filesystems
echo Mounting kernel filesystems
mount -t proc -o nosuid,noexec,nodev proc /proc
mount -t sysfs -o nosuid,noexec,nodev sys /sys
mdev -s
mkdir -p /ro /rw /merged

# Mount the CDROM
echo Mounting live medium
mount -t iso9660 LABEL=FIDELIXLIVE /ro

# Mount the root ramdisk
echo Mounting writable ramdisk at /rw
mount -t tmpfs -o size=4G tmpfs /rw
mkdir /rw/root /rw/work

# Mount the overlayfs
echo Remounting / as rw
mount -t overlay overlay -olowerdir=/ro,upperdir=/rw/root,workdir=/rw/work \
	/merged

# Switch Root
echo Switching root
exec switch_root /merged /sbin/init

