PKG_NAME=package
PKG_VERSION=1.0
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

# The URLs of the source archives. Specify multiple URLS as a space separated
# list.
PKG_WGET_URLS=https://musl.libc.org/releases/musl-$(PKG_VERSION).tar.gz
# The file names of the source archives. Specify multiple files as a space
# separated list.
PKG_SRC_ARCHIVES=musl-$(PKG_VERSION).tar.gz
# The package source directory, as it appears in the source archives
PKG_SRC_DIR=musl-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(OS_TARGET_TRIPLET)
# Add any additional argument that should be passed to make here
AUTOCONF_MAKE_ARGS=
# Add any additional argument that should be passed to make install here
AUTOCONF_MAKE_INSTALL_ARGS=

include package.mk

# All the autoconf- targets below are optional. You can make use of variables
# defined in this Makefile, package.mk, package-common.mk, and autoconf.mk.

# Commands to run before ./configure
autoconf-preconfigure:

# Commands to run after ./configure, before make
autoconf-premake:

# Commands to run after make, before make install
autoconf-preinstall:

# Commands to run after make install
autoconf-prepackage:

