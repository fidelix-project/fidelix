.SECONDARY: install
install: $(SYSROOT)/etc/fstab

$(SYSROOT)/etc/fstab reinstall:
	genfstab $(SYSROOT) > $(SYSROOT)/etc/fstab

# Don't error on make clean, etc
download verify build clean scrub neat tidy:
	@exit 0

include sysconfig.mk

