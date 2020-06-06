PKG_NAME=pcre
PKG_VERSION=8.44
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl libedit

PKG_WGET_URLS=https://ftp.pcre.org/pub/pcre/pcre-$(PKG_VERSION).tar.bz2
PKG_SRC_ARCHIVES=pcre-$(PKG_VERSION).tar.bz2
PKG_SRC_DIR=pcre-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--enable-unicode-properties \
	--enable-pcre16 \
	--enable-pcre32 \
	--enable-pcregrep-libz \
	--enable-pcretest-libedit \
	--disable-static \
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

