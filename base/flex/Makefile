PKG_NAME=flex
PKG_VERSION=2.6.4
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl m4

PKG_WGET_URLS=https://github.com/westes/flex/releases/download/v$(PKG_VERSION)/flex-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=flex-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=flex-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-bootstrap \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

#export CC=	$(TARGET_CC)
#export CXX=	$(TARGET_CXX)
#export LD=	$(TARGET_LD)
#export AR=	$(TARGET_AR)
#export AS=	$(TARGET_AS)
#export RANLIB=	$(TARGET_RANLIB)
#export STRIP=	$(TARGET_STRIP)

include package.mk

autoconf-prepackage:
	ln -sv flex $(PKG_ROOT)/usr/bin/lex

