PKG_NAME=libstdcxx
PKG_VERSION=9.3.0
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

# Build time dependencies for this package
PKG_BUILD_DEPENDS=gcc

include sysconfig.mk
include package.mk

.stamp_build: Makefile
	install -dm 755 $(PKG_ROOT)/usr/lib
	install -m 644 $(SYSROOT)/usr/lib/libgcc_s.so $(PKG_ROOT)/usr/lib/
	install -m 644 $(SYSROOT)/usr/lib/libgcc_s.so.1 $(PKG_ROOT)/usr/lib/
	cp -dp $(SYSROOT)/usr/lib/libstdc++* $(PKG_ROOT)/usr/lib/
	touch $@

