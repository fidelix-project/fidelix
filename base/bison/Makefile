PKG_NAME=bison
PKG_VERSION=3.5.2
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl m4

PKG_WGET_URLS=http://ftp.gnu.org/gnu/bison/bison-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=bison-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=bison-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

include package.mk

