include sysconfig.mk
include depends.mk

# Determine whether to install the MBR
ifeq ($(INSTALL_MBR), y)
_GRUB_ARGS+=
else ifeq ($(INSTALL_MBR), n)
_GRUB_ARGS+= --no-bootsector
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

KERNEL_ARGS+=root=$(ROOT_PART) rw

########### End Kernel Arguments ##########

export INSTALL_MBR SYSROOT SERIAL_PORT GRUB_COMMANDS
export KERNEL_ARGS KERNEL_LOCATION
export OS_NAME OS_VERSION

.PHONY: install install-grub
ifeq ($(INSTALL_GRUBCFG),n)
install: install-grub 
else ifeq ($(INSTALL_GRUBCFG),y)
install: install-grub $(SYSROOT)/boot/grub/grub.cfg 
else
install:
	@echo "*** Variable INSTALL_GRUBCFG must be set to y/n ***"
	@exit 1
endif

$(SYSROOT)/boot/grub/grub.cfg: grub.cfg
	install -m 644 grub.cfg $(SYSROOT)/boot/grub/

install-grub: grub.cfg
	@if [ -z "$(INSTALL_MBR)" ]; then \
		echo "*** Variable INSTALL_MBR must be set to y/n ***"; \
		exit 1; \
	fi
	@if [ -z "$(GRUB_DRIVE)" ]; then \
		echo "*** Variable GRUB_DRIVE must be set to the dirve you \
want to install Grub to. If in doubt, /dev/sda is usually a good choice. ***"; \
		exit 1; \
	fi
	grub-install --boot-directory=$(SYSROOT)/boot \
		$(_GRUB_ARGS) $(GRUB_DRIVE)

.PHONY: grub.cfg
grub.cfg: package-blkid
	./makegrubcfg.sh > grub.cfg

