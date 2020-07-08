PKG_NAME=libelf
PKG_VERSION=12.1.1
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

include sysconfig.mk
include package.mk

# Add any additional source files that may be modified as dependencies of this
# target.
.stamp_build: Makefile
	$(MAKE) -C src clean
	$(MAKE) -C src \
		CC="$(TARGET_CC)" \
		CFLAGS="$(CFLAGS)" \
		LDFLAGS="$(LDFLAGS)" \
		$(MAKE_FLAGS)
	$(MAKE) -C src \
		DESTDIR=$(PKG_ROOT) \
		install
	touch $@

