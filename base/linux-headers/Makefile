PKG_NAME=linux-headers
PKG_VERSION=5.4.24
PKG_BUILD=1
PKG_BUILDSYSTEM=custom-common

PKG_WGET_URLS=https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=linux-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=linux-$(PKG_VERSION)

include package.mk

abs_srctree=$(CURDIR)/pkg_src/$(PKG_SRC_DIR)

.stamp_custom_build: 
	make -C pkg_src/$(PKG_SRC_DIR) \
		abs_srctree=$(abs_srctree) mrproper
	make -C pkg_src/$(PKG_SRC_DIR) \
		ARCH=$(ARCH_KERNEL) abs_srctree=$(abs_srctree) headers
	cd pkg_src/$(PKG_SRC_DIR); find usr/include -name '.*' -delete
	rm pkg_src/$(PKG_SRC_DIR)/usr/include/Makefile
	install -dm 755 $(PKG_ROOT)/usr/include
	cp -r pkg_src/$(PKG_SRC_DIR)/usr/include/* $(PKG_ROOT)/usr/include/
	touch $@

