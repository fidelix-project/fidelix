PKG_NAME=mpfr
PKG_VERSION=4.0.2
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl gmp

PKG_WGET_URLS=http://www.mpfr.org/mpfr-$(PKG_VERSION)/mpfr-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=mpfr-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=mpfr-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--disable-static \
	--enable-thread-safe \
	--with-sysroot=$(SYSROOT) \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

include package.mk

# Commands to run after make install
autoconf-prepackage:
	cd pkg_src/$(PKG_SRC_DIR); make install-html DESTDIR=$(PKG_ROOT)

