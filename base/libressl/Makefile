PKG_NAME=libressl
PKG_VERSION=3.1.3
PKG_BUILD=2
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=libressl-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=libressl-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--with-openssldir=/etc/ssl \
	--with-sysroot=$(SYSROOT) \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

CC=	$(TARGET_CC)
export CC

include package.mk

