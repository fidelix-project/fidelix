PKG_NAME=ntpd
PKG_VERSION=6.2p3
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl libressl

PKG_WGET_URLS=https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/openntpd-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=openntpd-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=openntpd-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--with-privsep-user=_ntpd \
	--with-privsep-path=/var/empty \
	--disable-static \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

# Commands to run after make install
autoconf-prepackage:
	pkgtool preserve-file $(PKG_ROOT)/etc/ntpd.conf
	install -dm 755 $(PKG_ROOT)/var/empty
# Install the Init Script
	install -dm 755 $(PKG_ROOT)/etc/init.d
	install -m 755 ntpd $(PKG_ROOT)/etc/init.d/

