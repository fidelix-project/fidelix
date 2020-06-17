include sysconfig.mk
include depends.mk

WORKDIR?=/tmp/images_work
OUTDIR?=$(HOME)/images/$(OS_NAME_LOWERCASE)-$(OS_VERSION)-$(OS_PKG_TAG)
IMG_BASENAME?=$(OS_NAME_LOWERCASE)-$(OS_FULL_VERSION)-$(OS_ARCH)-$(OS_PKG_TAG)
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

# Image file names
IMG_USB=$(OUTDIR)/$(USB_IMG_NAME).$(COMP_EXT) 
IMG_ISO=$(OUTDIR)/$(IMG_BASENAME).iso
IMG_SRC=$(OUTDIR)/$(IMG_BASENAME)-src.tar.$(COMP_EXT)
IMG_PKGS=$(OUTDIR)/$(IMG_BASENAME)-pkgs.tar.$(COMP_EXT)

.PHONY: all usb iso src pkgs
all: usb iso src pkgs
usb: $(IMG_USB)
iso: $(IMG_ISO)
src: $(IMG_SRC)
pkgs: $(IMG_PKGS)

.PHONY: clean
clean:
	rm -f *.iso *.img *.img.*

.PHONY: world
world:
	$(MAKE) -C $(OS_SRC_DIR) world

$(IMG_USB): $(OUTDIR) package-grub world
	cd support && ./makeusbimage.sh

$(IMG_ISO): $(OUTDIR) $(WORKDIR) world \
	package-xorriso package-grub package-blkid
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
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/root SELECTION=basic \
		install-selection
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/root tidy
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/root copy-src
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/iso/root copy-pkgs
	install -m 644 support/issue.iso $(WORKDIR)/iso/root/etc/issue

# Make the GRUB bootdisk
	install -m 644 support/iso-grub.cfg \
		$(WORKDIR)/iso/root/boot/grub/grub.cfg
	grub-mkrescue -o $@ "--modules=$(GRUB_MODULES)" \
		$(WORKDIR)/iso/root -- -volid "FIDELIXLIVE"

$(IMG_SRC): $(OUTDIR) $(WORKDIR)
	-rm -rf $(WORKDIR)/src
	mkdir -p $(WORKDIR)/src/usr/src
	make -C $(OS_SRC_DIR) tidy
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/src copy-src
	tar cf $@ -C "$(WORKDIR)/src/usr" src

$(IMG_PKGS): $(OUTDIR) $(WORKDIR) world
	-rm -rf $(WORKDIR)/pkgs
	mkdir -p $(WORKDIR)/pkgs/var/packages
	make -C $(OS_SRC_DIR) tidy
	make -C $(OS_SRC_DIR) SYSROOT=$(WORKDIR)/pkgs copy-pkgs
	tar cf $@ -C "$(WORKDIR)/pkgs/var" packages

$(OUTDIR) $(WORKDIR):
	mkdir -p $@

%:

