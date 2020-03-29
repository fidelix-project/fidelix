PKG_NAME=texinfo
PKG_VERSION=6.7
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl perl

PKG_WGET_URLS=http://ftp.gnu.org/gnu/texinfo/texinfo-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=texinfo-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=texinfo-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

