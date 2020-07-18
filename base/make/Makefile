PKG_NAME=make
PKG_VERSION=4.3
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=http://ftp.gnu.org/gnu/make/make-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=make-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=make-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

include package.mk

