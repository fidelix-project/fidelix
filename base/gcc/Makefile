PKG_NAME=gcc
PKG_VERSION=9.3.0
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf-dedicated-builddir

# Build time dependencies for this gcc
PKG_BUILD_DEPENDS=musl zlib gmp mpfr mpc libstdcxx

PKG_WGET_URLS=\
	http://ftp.gnu.org/gnu/gcc/gcc-$(PKG_VERSION)/gcc-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=gcc-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=gcc-$(PKG_VERSION)

# The bootstrap g++ doesn't find the c++ headers on its own
ifeq ($(OS_PKG_TAG), bs)
export CXXFLAGS=-I /usr/include/c++/$(PKG_VERSION)
endif

# Avoid a hard coded sed path
export SED=sed

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--disable-multilib \
	--enable-languages=c,c++ \
	--with-system-zlib \
	--enable-shared \
	--enable-threads=posix \
	--enable-libstdcxx \
	--disable-werror \
	--disable-bootstrap \
	--disable-libsanitizer \
	--enable-checking=release \
	--build=$(OS_TARGET_TRIPLET)

ifneq ($(CONFIG_ENABLE_HARDENING), n)
AUTOCONF_CONFIGURE_ARGS+=\
	--enable-default-pie \
	--enable-default-ssp
endif

include package.mk

autoconf-prepackage:
	install -dm 755 $(PKG_ROOT)/lib
	install -m 755 cpp-shim $(PKG_ROOT)/lib/cpp
	install -dm 755 $(PKG_ROOT)/usr/bin
	ln -s gcc $(PKG_ROOT)/usr/bin/cc

