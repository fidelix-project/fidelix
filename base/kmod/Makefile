PKG_NAME=kmod
PKG_VERSION=26
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=bison flex

PKG_WGET_URLS=https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=kmod-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=kmod-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--bindir=/sbin \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

# Applets to symlink to kmod
KMOD_APPLETS=lsmod rmmod insmod modinfo modprobe depmod 

$(PKG_ROOT)/sbin/%:
	ln -s kmod $@

# Commands to run after make install
autoconf-prepackage: $(addprefix $(PKG_ROOT)/sbin/,$(KMOD_APPLETS))

