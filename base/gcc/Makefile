PKG_NAME=gcc
PKG_VERSION=9.3.0
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf-dedicated-builddir

# Build time dependencies for this gcc
PKG_BUILD_DEPENDS=musl zlib gmp mpfr mpc

PKG_WGET_URLS=\
	http://ftp.gnu.org/gnu/gcc/gcc-$(PKG_VERSION)/gcc-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=gcc-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=gcc-$(PKG_VERSION)

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
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

ifneq ($(CONFIG_ENABLE_HARDENING), n)
AUTOCONF_CONFIGURE_ARGS+=\
	--enable-default-pie \
	--enable-default-ssp
endif

# Handle Cross Compiling
include toolchain.mk

ifeq ($(ALT_ROOT), y)
AUTOCONF_CONFIGURE_ARGS+= \
	--with-libtool-sysroot=$(SYSROOT) \
	--with-sysroot=/ \
	--with-build-sysroot=$(SYSROOT)

CC_FOR_TARGET=		$(TARGET_CC)
CXX_FOR_TARGET=		$(TARGET_CXX)
LD_FOR_TARGET=		$(TARGET_LD)
AR_FOR_TARGET=		$(TARGET_AR)
AS_FOR_TARGET=		$(TARGET_AS)
RANLIB_FOR_TARGET=	$(TARGET_RANLIB)
STRIP_FOR_TARGET=	$(TARGET_STRIP)
export CC_FOR_TARGET CXX_FOR_TARGET LD_FOR_TARGET AR_FOR_TARGET AS_FOR_TARGET
export RANLIB_FOR_TARGET STRIP_FOR_TARGET
endif

include package.mk

autoconf-prepackage:
	install -dm 755 $(PKG_ROOT)/lib
	install -m 755 cpp-shim $(PKG_ROOT)/lib/cpp
	install -dm 755 $(PKG_ROOT)/usr/bin
	ln -s gcc $(PKG_ROOT)/usr/bin/cc

