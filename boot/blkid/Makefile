PKG_NAME=blkid
PKG_VERSION=2.35.1
PKG_MMVER=2.35
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://www.kernel.org/pub/linux/utils/util-linux/v$(PKG_MMVER)/util-linux-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=util-linux-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=util-linux-$(PKG_VERSION)

LDFLAGS+= -static
export LDFLAGS

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--program-prefix=util-linux- \
	--build=$(OS_TARGET_TRIPLET)
AUTOCONF_MAKE_ARGS=blkid
AUTOCONF_SKIP_MAKE_INSTALL=y

include package.mk

autoconf-preinstall:
	install -dm 755 $(PKG_ROOT)/usr/sbin
	install -m 700 -o 0 -g 0 $(PKG_SRC)/blkid $(PKG_ROOT)/usr/sbin/util-linux-blkid

