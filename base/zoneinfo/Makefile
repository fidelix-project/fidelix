PKG_NAME=zoneinfo
PKG_VERSION=2020a
PKG_BUILD=1
PKG_BUILDSYSTEM=make

PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=\
	https://www.iana.org/time-zones/repository/releases/tzdata$(PKG_VERSION).tar.gz \
	https://www.iana.org/time-zones/repository/releases/tzcode$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=\
	tzdata$(PKG_VERSION).tar.gz \
	tzcode$(PKG_VERSION).tar.gz
PKG_SRC_DIR=

MAKE_ARGS=cc="$(TARGET_CC)" CFLAGS="$(CFLAGS)" zic="$(HOST_ZIC)"
MAKE_INSTALL_ARGS=zic="$(HOST_ZIC)"

include package.mk

# All the make- targets below are optional. You can make use of variables
# defined in this Makefile, package.mk, package-common.mk, and autoconf.mk.

# Commands to run before make
make-premake:
# Adjust tzdata to use /bin/sh instead of /bin/bash
	sed -i pkg_src/Makefile -e '/^KSHELL=/c\KSHELL=/bin/sh'

# Commands to run after make, before make install
make-preinstall:

# Commands to run after make install
make-prepackage:
	pkgtool preserve-file $(PKG_ROOT)/etc/localtime

