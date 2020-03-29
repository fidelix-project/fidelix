PKG_NAME=zlib
PKG_VERSION=1.2.11
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://zlib.net/zlib-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=zlib-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=zlib-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS= --prefix=/usr

include package.mk

# Commands to run after make install
autoconf-prepackage:
	install -d $(PKG_ROOT)/lib
	mv -v $(PKG_ROOT)/usr/lib/libz.so* $(PKG_ROOT)/lib/
	ln -sfv ../../lib/libz.so $(PKG_ROOT)/usr/lib/libz.so

