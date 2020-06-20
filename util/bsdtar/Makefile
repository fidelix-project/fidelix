PKG_NAME=bsdtar
PKG_VERSION=3.4.3
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl libressl

PKG_WGET_URLS=http://libarchive.org/downloads/libarchive-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=libarchive-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=libarchive-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--enable-bsdtar \
	--disable-bsdcpio \
	--disable-shared \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

autoconf-prepackage:
	rm -rf $(PKG_ROOT)/usr/lib
	rm -rf $(PKG_ROOT)/usr/include
	rm -rf $(PKG_ROOT)/usr/share/man/man3

