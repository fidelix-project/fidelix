PKG_NAME=busybox
PKG_VERSION=1.31.1
PKG_BUILD=2
PKG_BUILDSYSTEM=custom-common

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://busybox.net/downloads/busybox-$(PKG_VERSION).tar.bz2
PKG_SRC_ARCHIVES=busybox-$(PKG_VERSION).tar.bz2
PKG_SRC_DIR=busybox-$(PKG_VERSION)

include package.mk

# Put custom build rules here. This target runs with $PWD set to the directory
# of this Makefile. Do NOT delete the touch $@.
.stamp_custom_build: 
ifeq ($(PKG_OS_TAG), bs)
	cp busybox-bootstrap-config pkg_src/$(PKG_SRC_DIR)/.config
else
	cp busybox-config pkg_src/$(PKG_SRC_DIR)/.config
endif
	make -C pkg_src/$(PKG_SRC_DIR) $(MAKE_FLAGS)
	make -C pkg_src/$(PKG_SRC_DIR) install CONFIG_PREFIX=$(PKG_ROOT)
	mkdir -p $(PKG_ROOT)/usr/share/man/man1
	install pkg_src/$(PKG_SRC_DIR)/docs/busybox.1 $(PKG_ROOT)/usr/share/man/man1
	touch $@

