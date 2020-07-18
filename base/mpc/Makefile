PKG_NAME=mpc
PKG_VERSION=1.1.0
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl gmp mpfr

PKG_WGET_URLS=https://ftp.gnu.org/gnu/mpc/mpc-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=mpc-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=mpc-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--disable-static \
	--with-sysroot=$(SYSROOT) \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

# Handle Cross Compiling
include toolchain.mk

ifeq ($(ALT_ROOT), y)
AUTOCONF_CONFIGURE_ARGS+= 
endif

include package.mk

# Commands to run after make install
autoconf-prepackage:
	cd pkg_src/$(PKG_SRC_DIR); make install-html DESTDIR=$(PKG_ROOT)

