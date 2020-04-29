PKG_NAME=xorriso
PKG_VERSION=1.5.2
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://www.gnu.org/software/xorriso/xorriso-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=xorriso-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=xorriso-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(OS_TARGET_TRIPLET)
AUTOCONF_MAKE_ARGS=
AUTOCONF_MAKE_INSTALL_ARGS=

include package.mk

# All the autoconf- targets below are optional. You can make use of variables
# defined in this Makefile, package.mk, package-common.mk, and autoconf.mk.

# Commands to run before ./configure
autoconf-preconfigure:

# Commands to run after ./configure, before make
autoconf-premake:

# Commands to run after make, before make install
autoconf-preinstall:

# Commands to run after make install
autoconf-prepackage:

