PKG_NAME=libressl
PKG_VERSION=3.1.3
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=libressl-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=libressl-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--with-openssldir=/etc/ssl \
	--build=$(OS_TARGET_TRIPLET)

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

