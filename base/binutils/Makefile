PKG_NAME=binutils
PKG_VERSION=2.34
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf-dedicated-builddir

# Build time dependencies for this binutils
PKG_BUILD_DEPENDS=musl zlib

PKG_WGET_URLS=http://ftp.gnu.org/gnu/binutils/binutils-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=binutils-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=binutils-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--enable-ld=default \
	--enable-plugins \
	--enable-shared \
	--disable-werror \
	--enable-64-bit-bfd \
	--build=$(OS_TARGET_TRIPLET)
AUTOCONF_MAKE_ARGS= 'tooldir=/usr'
AUTOCONF_MAKE_INSTALL_ARGS= 'tooldir=/usr'

include package.mk

