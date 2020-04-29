#!/bin/sh

WORKDIR=${WORKDIR:-/tmp/images_work}
OUTDIR=${OUTDIR:-$HOME/images}
IMG_BASENAME=${IMG_BASENAME:-liveusb}
COMP_EXT=${COMP_EXT:-bz2}
COMP_PROG=${COMP_PROG:-bzip2}
OS_SRC_DIR=${OS_SRC_DIR:-/usr/src}
ISSUE_FILE=${ISSUE_FILE:-./issue.install}

USB_IMG_NAME=${IMG_BASENAME}.img
# Image size in KB. Should fit on most 4GB flash drives.
USB_IMG_SIZE=${USB_IMG_SIZE:-3800000}

die () {
	rm /tmp/$$*
	echo $@
	exit 1
}

# Check that every necessary variable is defined
[ -z "$OS_ARCH" ] && die The OS_ARCH variable must be set

echo $OUTDIR

# Create the image file and setup it up as a gadget device.
echo Creating a base image of $USB_IMG_SIZE KB.
dd if=/dev/zero of=${OUTDIR}/${USB_IMG_NAME}.part bs=1024 count=${USB_IMG_SIZE} || die
echo Installing the Gadget USB Driver
modprobe -r g_mass_storage
ls /dev | grep sd > /tmp/$$_ls1 || die
modprobe dummy_hcd || die Failed to load dummy_hcd module
modprobe g_mass_storage file=${OUTDIR}/${USB_IMG_NAME}.part || die Failed to load g_mass_storage module

# Give the kernel time to process the new drive
echo Waiting for the kernel to find the new drive
sleep 10
ls /dev | grep sd > /tmp/$$_ls2
DRIVE=$(diff -U 0 /tmp/$$_ls1 /tmp/$$_ls2 | tac | grep -m 1 ^+ | cut -d '+' -f 2)
[ -z "$DRIVE" ] && die Failed to find gadget drive
echo Using Drive ${DRIVE} as Gadget Drive

# Follow the installation instructions from ../INSTALL.md
# Ugly hack to create one partition starting at sector 1024 spanning the entire
# disk.
echo Partitioning drive
echo -e 'o\ny\nn\n1\n\n+1M\nef02\nn\n2\n\n\n\nw\ny\n' | tee /dev/stderr | gdisk /dev/${DRIVE} || die Failed to partition drive 
partprobe
echo Formatting drive
mkfs.ext2 /dev/${DRIVE}2 || die mkfs failed
mount /dev/${DRIVE}2 /mnt || die mount failed
rmdir /mnt/lost+found

# Install the system
echo Installing the base system
echo "make -I ${OS_SRC_DIR}/include -C ${OS_SRC_DIR} SYSTEM=liveusb-${OS_ARCH} SYSROOT=/mnt install"
make -I ${OS_SRC_DIR}/include -C ${OS_SRC_DIR} SYSTEM=liveusb-${OS_ARCH} SYSROOT=/mnt install || die Failed to install base system
echo Installing the bootloader
make -I ${OS_SRC_DIR}/include -C ${OS_SRC_DIR} SYSTEM=liveusb-${OS_ARCH} SYSROOT=/mnt \
	GRUB_DRIVE=/dev/${DRIVE} install-bootloader || die Failed to install bootloader
echo Installing the operating system source code
# Avoid copying the source files; we want only the binary packages.
make -I ${OS_SRC_DIR}/include -C ${OS_SRC_DIR} tidy || die make tidy failed
make -I ${OS_SRC_DIR}/include -C ${OS_SRC_DIR} SYSTEM=liveusb-${OS_ARCH} SYSROOT=/mnt copy-src || die "Failed to install source code (make copy-src failed)"
# Copy the issue file
cp "$ISSUE_FILE" /mnt/etc/issue || die "Failed to copy issue file ($ISSUE_FILE)"
echo Unmounting
umount /mnt || die umount failed

# Remove the loopback device and finish up the image
modprobe -r g_mass_storage || die Failed to remove g_mass_storage
echo Compressing the image
eval ${COMP_PROG} -k ${OUTDIR}/${USB_IMG_NAME}.part || die Compression failed
mv ${OUTDIR}/${USB_IMG_NAME}.part.${COMP_EXT} ${OUTDIR}/${USB_IMG_NAME}.${COMP_EXT} || die Failed to rename image

# Cleanup
rm /tmp/$$*

