include sysconfig.mk
include depends.mk

WORKDIR?=/tmp/images_work
OUTDIR?=$(HOME)/images/$(OS_NAME_LOWERCASE)-$(OS_VERSION)-$(OS_PKG_TAG)
IMG_BASENAME?=$(OS_NAME_LOWERCASE)-$(OS_VERSION)-$(OS_ARCH)-$(OS_PKG_TAG)
COMP_EXT?=gz
COMP_PROG?=gzip

export OUTDIR WORKDIR IMG_BASENAME COMP_EXT COMP_PROG \
	USB_IMG_SIZE OS_ARCH OS_SRC_DIR

GRUB_MODULES:=\
	part_gpt part_msdos ntfs ntfscomp hfsplus fat ext2 normal chain \
	boot configfile linux multiboot iso9660 gfxmenu gfxterm loadenv \
	png ext2 ntfscomp loopback search \
	minicmd cat cpuid elf usb videotest halt help ls reboot echo \
	test normal sleep memdisk tar font video_fb video gettext true \
	video_bochs video_cirrus multiboot2 acpi

USB_IMG_NAME=$(IMG_BASENAME).img
# Image size in KB. Should fit on most 4GB flash drives.
USB_IMG_SIZE=3800000

USB_FULL_IMG_NAME=$(IMG_BASENAME)-full.img
# Image size in KB. Should fit on most 8GB flash drives.
USB_FULL_IMG_SIZE=7800000

ISO_IMG_NAME=$(IMG_BASENAME).iso

.PHONY: all usb iso
all: usb iso
usb: $(OUTDIR)/$(USB_IMG_NAME).$(COMP_EXT) 
iso: $(OUTDIR)/$(IMG_BASENAME).iso

.PHONY: clean
clean:
	rm -f *.iso *.img *.img.*

$(OUTDIR)/$(USB_IMG_NAME).$(COMP_EXT): $(OUTDIR) package-grub
	cd support && ./makeusbimage.sh

$(OUTDIR)/$(IMG_BASENAME).iso: $(OUTDIR) $(WORKDIR) \
	package-xorriso package-grub
# Setup
	-rm -rf $(WORKDIR)/iso
	mkdir -p $(WORKDIR)/iso/root
	mkdir -p $(WORKDIR)/iso/initrd

# Create the initrd
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/initrd SELECTION=initrd \
		install-selection
	install -m 755 support/iso-init.sh $(WORKDIR)/iso/initrd/init
	install -dm 755 $(WORKDIR)/iso/initrd/proc
	install -dm 755 $(WORKDIR)/iso/initrd/sys
	install -dm 755 $(WORKDIR)/iso/root/boot/grub
	cd $(WORKDIR)/iso/initrd && \
		find . | cpio -H newc -ov | gzip -9 > \
		$(WORKDIR)/iso/root/boot/initrd

# Install the system
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/root install
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/root tidy
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/root copy-src
	install -m 644 support/issue.iso $(WORKDIR)/iso/root/etc/issue

# Make the GRUB bootdisk
	install -m 644 support/iso-grub.cfg \
		$(WORKDIR)/iso/root/boot/grub/grub.cfg
	grub-mkrescue -o $@ $(WORKDIR)/iso/root -- -volid "FIDELIXLIVE"
#	grub-mkrescue -o $@ --modules=$(GRUB_MODULES) $(WORKDIR)/iso

$(OUTDIR) $(WORKDIR):
	mkdir $@

%:

