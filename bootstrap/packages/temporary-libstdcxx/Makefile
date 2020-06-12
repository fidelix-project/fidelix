PKG_NAME=temporary-libstdcxx
PKG_VERSION=9.3.0
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf-dedicated-builddir

PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=\
	http://ftp.gnu.org/gnu/gcc/gcc-$(PKG_VERSION)/gcc-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=gcc-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=gcc-$(PKG_VERSION)/libstdc++-v3

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--disable-multilib \
	--enable-64-bit-bfd \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

