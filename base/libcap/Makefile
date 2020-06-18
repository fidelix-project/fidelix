PKG_NAME=libcap
PKG_VERSION=2.33
PKG_BUILD=1
PKG_BUILDSYSTEM=make

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://mirrors.edge.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=libcap-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=libcap-$(PKG_VERSION)

MAKE_ARGS= lib=lib prefix=/usr
MAKE_INSTALL_ARGS= lib=lib prefix=/usr

include package.mk

# All the make- targets below are optional. You can make use of variables
# defined in this Makefile, package.mk, package-common.mk, and autoconf.mk.

# Commands to run before make
make-premake:
# Prevent two static libraries from being installed
	sed -i '/install.*STA...LIBNAME/d' $(PKG_SRC)/libcap/Makefile

# Commands to run after make, before make install
make-preinstall:

# Commands to run after make install
make-prepackage:
	chmod 755 $(PKG_ROOT)/usr/lib/libcap.so.2.*

