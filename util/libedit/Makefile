PKG_NAME=libedit
PKG_VERSION=3.1
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf
TARBALL_DATE=20191231

PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://www.thrysoee.dk/editline/libedit-$(TARBALL_DATE)-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=libedit-$(TARBALL_DATE)-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=libedit-$(TARBALL_DATE)-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

include package.mk

