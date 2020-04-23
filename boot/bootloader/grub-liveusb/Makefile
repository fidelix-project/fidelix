include sysconfig.mk
include depends.mk

# Bundle a bunch of modules that might be necessary for booting on some
# platforms since we don't know what platform(s) this image will be booted on.
GRUB_MODULES=part_gpt part_msdos ntfs ntfscomp hfsplus fat ext2 normal chain \
	boot configfile linux multiboot iso9660 gfxmenu gfxterm loadenv \
	png ext2 ntfscomp loopback search \
	minicmd cat cpuid elf usb videotest halt help ls reboot echo \
	test normal sleep memdisk tar font video_fb video gettext true \
	video_bochs video_cirrus multiboot2 acpi

# Determine whether to install the MBR. For a live image, people probably want
# this installed, so we'll default to y.
ifeq ($(INSTALL_MBR), n)
_GRUB_ARGS+= --no-bootsector
else
_GRUB_ARGS+=
endif

# Determine if a /boot partition is being used.
$(shell mountpoint -q $(SYSROOT)/boot)
ifeq ($(.SHELLSTATUS), 0)
KERNEL_LOCATION=
else
KERNEL_LOCATION=/boot
endif

########### Begin Kernel Arguments ##########

# Determine the root partition.
ROOT_DEV?=$(shell mountpoint -n $(SYSROOT) | awk '{ print $$1 }')
ifeq ($(ROOT_DEV), UNKNOWN)
$(error $(SYSROOT) is on an unknown partition)
endif
# Try to get the PARTUUID
ROOT_PART?=PARTUUID=$(shell util-linux-blkid $(ROOT_DEV) -s PARTUUID -o value)
ifeq ($(ROOT_PART), PARTUUID=)
ROOT_PART=$(ROOT_DEV)
endif

KERNEL_ARGS+= root=$(ROOT_PART) rw

# Wait for the root device to become available. The system usually kernel
# panics when booting from a flash drive or SD card without this.
KERNEL_ARGS+= rootwait

########### End Kernel Arguments ##########

export INSTALL_MBR SYSROOT SERIAL_PORT GRUB_COMMANDS
export KERNEL_ARGS KERNEL_LOCATION
export OS_NAME OS_VERSION

.PHONY: install install-grub
# Once again, default to installing the grub.cfg
ifeq ($(INSTALL_GRUBCFG),n)
install: install-grub 
else ($(INSTALL_GRUBCFG),y)
install: install-grub $(SYSROOT)/boot/grub/grub.cfg 
endif

$(SYSROOT)/boot/grub/grub.cfg: grub.cfg
	install -m 644 grub.cfg $(SYSROOT)/boot/grub/

install-grub: grub.cfg
	@if [ -z "$(GRUB_DRIVE)" ]; then \
		echo "*** Variable GRUB_DRIVE must be set to the dirve you \
want to install Grub to. If in doubt, /dev/sda is usually a good choice. ***"; \
		exit 1; \
	fi
	grub-install --boot-directory=$(SYSROOT)/boot \
		--verbose \
		--modules="$(GRUB_MODULES)" \
		$(_GRUB_ARGS) $(GRUB_DRIVE)

.PHONY: grub.cfg
grub.cfg: package-blkid
	$(OS_SRC_DIR)/scripts/makegrubcfg.sh > grub.cfg

