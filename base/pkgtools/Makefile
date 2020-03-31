PKG_NAME=pkgtools
PKG_VERSION=0.0.10
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

include sysconfig.mk
include package.mk

# Add any additional source files that may be modified as dependencies of this
# target.
.stamp_build: Makefile
	make clean
	cd src; make \
		MANDIR=$(PKG_ROOT)/usr/share/man \
		DESTDIR=$(PKG_ROOT) \
		install
	touch $@

