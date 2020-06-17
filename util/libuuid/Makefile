PKG_NAME=libuuid
PKG_VERSION=2.35.1
PKG_MMVER=2.35
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://www.kernel.org/pub/linux/utils/util-linux/v$(PKG_MMVER)/util-linux-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=util-linux-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=util-linux-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-all-programs \
	--enable-libuuid \
	--build=$(OS_TARGET_TRIPLET)
AUTOCONF_MAKE_ARGS=

include package.mk

