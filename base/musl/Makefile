PKG_NAME=musl
PKG_VERSION=1.2.0
PKG_BUILD=2
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=linux-headers

PKG_WGET_URLS=https://musl.libc.org/releases/musl-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=musl-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=musl-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

autoconf-prepackage:
	mv $(PKG_ROOT)/usr/lib/libc.so $(PKG_ROOT)/lib/libc.so
	ln -sf libc.so $(PKG_ROOT)/lib/ld-musl-$(DYNLD_ARCH).so.1
	ln -sf ../../lib/libc.so $(PKG_ROOT)/usr/lib/libc.so
	install -dm 755 $(PKG_ROOT)/bin
	ln -sf ../lib/ld-musl-$(DYNLD_ARCH).so.1 $(PKG_ROOT)/bin/ldd
	install -dm 755 $(PKG_ROOT)/etc
	install -m 644 config/ld-musl-$(DYNLD_ARCH).path $(PKG_ROOT)/etc/
	pkgtool preserve-file $(PKG_ROOT)/etc/ld-musl-$(DYNLD_ARCH).path 

