PKG_NAME=gptfdisk
PKG_VERSION=1.0.3
PKG_BUILD=1
PKG_BUILDSYSTEM=make

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl libstdcxx ncurses libuuid

PKG_WGET_URLS=https://downloads.sourceforge.net/gptfdisk/gptfdisk-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=gptfdisk-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=gptfdisk-$(PKG_VERSION)

MAKE_ARGS=gdisk cgdisk fixparts
MAKE_INSTALL_ARGS=
MAKE_SKIP_MAKE_INSTALL=y

include toolchain.mk

MAKE_ARGS+=	CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"

include package.mk

make-premake:
make-preinstall:
make-prepackage:
	install -dm 755 $(PKG_ROOT)/usr/sbin
	install -m 755 $(PKG_SRC)/gdisk $(PKG_ROOT)/usr/sbin
	install -m 755 $(PKG_SRC)/cgdisk $(PKG_ROOT)/usr/sbin
	install -m 755 $(PKG_SRC)/fixparts $(PKG_ROOT)/usr/sbin
	install -dm 755 $(PKG_ROOT)/usr/share/man/man8
	install -m 644 $(PKG_SRC)/gdisk.8 $(PKG_ROOT)/usr/share/man/man8
	install -m 644 $(PKG_SRC)/cgdisk.8 $(PKG_ROOT)/usr/share/man/man8
	install -m 644 $(PKG_SRC)/fixparts.8 $(PKG_ROOT)/usr/share/man/man8

