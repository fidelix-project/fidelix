PKG_NAME=m4
PKG_VERSION=1.4.18
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=http://ftp.gnu.org/gnu/m4/m4-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=m4-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=m4-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--target=$(OS_TARGET_TRIPLET)

include package.mk

