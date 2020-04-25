include sysconfig.mk

WORKDIR?=/tmp/images_work
OUTDIR?=$(HOME)/images
IMG_BASENAME?=$(OS_NAME_LOWERCASE)-$(OS_VERSION)-$(OS_PKG_TAG)
COMP_EXT?=bz2
COMP_PROG?=bzip2

USB_IMG_NAME=$(IMG_BASENAME).img
# Image size in KB. Should fit on most 4GB flash drives.
USB_IMG_SIZE=3800000

USB_FULL_IMG_NAME=$(IMG_BASENAME)-full.img
# Image size in KB. Should fit on most 8GB flash drives.
USB_FULL_IMG_SIZE=7800000

$(OUTDIR)/$(USB_IMG_NAME).$(COMP_EXT): $(OUTDIR)
# Create the image file and setup it up as a loopback device.
	dd if=/dev/zero of=$(OUTDIR)/$(USB_IMG_NAME).part bs=1024 count=$(USB_IMG_SIZE)
	-modprobe -r g_mass_storage
	modprobe dummy_hcd
	modprobe g_mass_storage file=$(OUTDIR)/$(USB_IMG_NAME).part
# Give the kernel time to process the new drive
	sleep 10
	$(eval DRIVE=$(shell dmesg | tac | grep -m 1 'Attached SCSI disk' | cut -d [ -f 3 | cut -d ] -f 1))
	echo Drive: $(DRIVE)
# Follow the installation instructions from ../INSTALL.md
# Ugly hack to create one partition starting at sector 1024 spanning the entire
# disk.
	echo -e 'o\nn\np\n1\n1024\n\nw\n' | fdisk /dev/$(DRIVE)
	partprobe
	mkfs.ext2 /dev/$(DRIVE)1
	mount /dev/$(DRIVE)1 /mnt
	rmdir /mnt/lost+found
	make -C $(OS_SRC_DIR) SYSTEM=liveusb-$(OS_ARCH) SYSROOT=/mnt install
# Copy our device map over to help GRUB figure out the disk layout
#	install -dm 755 /mnt/boot/grub
#	install -m 644 device.map /mnt/boot/grub/
	make -C $(OS_SRC_DIR) SYSTEM=liveusb-$(OS_ARCH) SYSROOT=/mnt \
		GRUB_DRIVE=/dev/$(DRIVE) install-bootloader
# Avoid copying the source files; we want only the binary packages.
	make -C $(OS_SRC_DIR) tidy
	make -C $(OS_SRC_DIR) SYSTEM=liveusb-$(OS_ARCH) SYSROOT=/mnt copy-src
	umount /mnt
# Remove the loopback device and finish up the image
	modprobe -r g_mass_storage
	$(COMP_PROG) -k $(OUTDIR)/$(USB_IMG_NAME).part
	mv $(OUTDIR)/$(USB_IMG_NAME).part.$(COMP_EXT) $@

$(OUTDIR) $(WORKDIR):
	mkdir $@

%:

