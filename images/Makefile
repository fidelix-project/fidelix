include sysconfig.mk

WORKDIR?=/tmp/images_work
OUTDIR?=$(HOME)/images
IMG_BASENAME?=$(OS_NAME)-$(OS_VERSION)-$(OS_RELEASE_NAME)
COMP_EXT?=bz2
COMP_PROG?=bzip2

USB_IMG_NAME=$(IMG_BASENAME)-standard.img
# Image size in KB. Should fit on most 4GB flash drives.
USB_IMG_SIZE=3800000

USB_FULL_IMG_NAME=$(IMG_BASENAME)-full.img
# Image size in KB. Should fit on most 8GB flash drives.
USB_FULL_IMG_SIZE=7800000

$(OUTDIR)/$(USB_IMG_NAME).$(COMP_EXT): $(OUTDIR) cleanup-previous-attempt
# Create the image file and setup it up as a loopback device.
	dd if=/dev/zero of=$(OUTDIR)/$(USB_IMG_NAME).part bs=1024 count=$(USB_IMG_SIZE)
	-losetup -d /dev/loop0
	losetup -P /dev/loop0 $(OUTDIR)/$(USB_IMG_NAME).part
# Follow the installation instructions from ../INSTALL.md
# Ugly hack to create one partition starting at sector 1024 spanning the entire
# disk.
	echo -e 'o\nn\np\n1\n1024\n\nw\n' | fdisk /dev/loop0
	partprobe
	mkfs.ext2 /dev/loop0p1
	mount /dev/loop0p1 /mnt
	make -C $(OS_SRC_DIR) SYSTEM=liveusb-$(OS_ARCH) SYSROOT=/mnt install
# Copy our device map over to help GRUB figure out the disk layout
#	install -dm 755 /mnt/boot/grub
#	install -m 644 device.map /mnt/boot/grub/
	make -C $(OS_SRC_DIR) SYSTEM=liveusb-$(OS_ARCH) SYSROOT=/mnt \
		GRUB_DRIVE=/dev/loop0 install-bootloader
# Avoid copying the source files; we want only the binary packages for the
# standard image.
	make -C $(OS_SRC_DIR) tidy
	make -C $(OS_SRC_DIR) SYSTEM=liveusb-$(OS_ARCH) SYSROOT=/mnt copy-src
	umount /mnt
# Remove the loopback device and finish up the image
	losetup -d /dev/loop0
	$(COMP_PROG) -k $(OUTDIR)/$(USB_IMG_NAME).part
	mv $(OUTDIR)/$(USB_IMG_NAME).part.$(COMP_EXT) $@

$(OUTDIR) $(WORKDIR):
	mkdir $@

.PHONY: cleanup-previous-attempt
cleanup-previous-attempt:
	-umount /mnt -l
	-losetup -d /dev/loop0

%:

