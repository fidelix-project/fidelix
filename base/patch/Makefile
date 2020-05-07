PKG_NAME=patch
PKG_VERSION=2.7.6
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=http://ftp.gnu.org/gnu/patch/patch-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=patch-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=patch-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

