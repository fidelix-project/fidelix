include sysconfig.mk

ifndef BOOT_LOADER
$(error No bootloader has been specified for installation. Specify one by \
setting the BOOT_LOADER variable to the desired bootloader target or using a \
SYSTEM that specifies a bootloader)
endif

.PHONY: install
install:
	make -C $(BOOT_LOADER) install

.PHONY: which
which:
	@echo Your bootloader target is: $(BOOT_LOADER)

