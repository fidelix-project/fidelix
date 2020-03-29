PKG_NAME=gmp
PKG_VERSION=6.2.0
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl m4

PKG_WGET_URLS=http://ftp.gnu.org/gnu/gmp/gmp-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=gmp-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=gmp-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

# This is necessary to achieve a generic build of GMP that isn't optimized for
# any specific processor. Remove this if you would like a GMP build optimized
# for your machine.
autoconf-preconfigure:
	cd pkg_src/$(PKG_SRC_DIR); cp -v configfsf.guess config.guess
	cd pkg_src/$(PKG_SRC_DIR); cp -v configfsf.sub   config.sub

# Commands to run after make install
autoconf-prepackage:
	cd pkg_src/$(PKG_SRC_DIR); make install-html DESTDIR=$(PKG_ROOT)

