PKG_NAME=linux-firmware
PKG_VERSION=20200316
PKG_BUILD=1
PKG_BUILDSYSTEM=custom-common

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

PKG_WGET_URLS=https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=linux-firmware-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=linux-firmware-$(PKG_VERSION)

include package.mk

# Put custom build rules here. This target runs with $PWD set to the directory
# of this Makefile. Do NOT delete the touch $@.
.stamp_custom_build: 
	install -dm 755 $(PKG_ROOT)/lib/firmware
	cp -r $(PKG_SRC)/* $(PKG_ROOT)/lib/firmware/
	touch $@

