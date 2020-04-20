.SECONDAR: install
install: $(SYSROOT)/etc/fstab

$(SYSROOT)/etc/fstab:
	genfstab $(SYSROOT) > $(SYSROOT)/etc/fstab

include sysconfig.mk

