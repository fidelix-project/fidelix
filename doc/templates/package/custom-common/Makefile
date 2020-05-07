PKG_NAME=package
PKG_VERSION=1.0
PKG_BUILD=1
PKG_BUILDSYSTEM=custom-common

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

PKG_WGET_URLS=https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=linux-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=linux-$(PKG_VERSION)
# If the patches should be applied from a directory other than $(PKG_SRC_DIR),
# set this variable:
# PKG_PATCH_DIR=
# If this package requires the use of a different patch binary than
# `which patch`, set this variable:
# PKG_PATCH_BINARY=

include package.mk

# Put custom build rules here. This target runs with $PWD set to the directory
# of this Makefile. Do NOT delete the touch $@.
.stamp_custom_build: 
	touch $@

