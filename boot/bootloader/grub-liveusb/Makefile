include sysconfig.mk
include depends.mk

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
		$(_GRUB_ARGS) $(GRUB_DRIVE)

.PHONY: grub.cfg
grub.cfg: package-blkid
	$(OS_SRC_DIR)/scripts/makegrubcfg.sh > grub.cfg

