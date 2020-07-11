PKG_NAME=grub
PKG_VERSION=2.04
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl texinfo ncurses bison

PKG_WGET_URLS=https://ftp.gnu.org/gnu/grub/grub-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=grub-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=grub-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-werror \
	--disable-efiemu \
	--with-sysroot=$(SYSROOT) \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET) \
	CC="$(TARGET_CC) $(CFLAGS)"

# The Grub configure script aborts if it can't find Python, but Python isn't
# actually needed to build Grub. Use this to trick ./configure.
export PYTHON=/bin/true

include package.mk

autoconf-prepackage:
	rm -rf $(PKG_ROOT)/etc

