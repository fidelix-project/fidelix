PKG_NAME=iptables
PKG_VERSION=1.8.4
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://www.netfilter.org/projects/iptables/files/iptables-$(PKG_VERSION).tar.bz2
PKG_SRC_ARCHIVES=iptables-$(PKG_VERSION).tar.bz2
PKG_SRC_DIR=iptables-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--disable-static \
	--disable-nftables \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

include package.mk

# Commands to run after make install
autoconf-prepackage:
	install -dm 755 $(PKG_ROOT)/etc/iptables
	install -m 600 -o 0 -g 0 rules4.default $(PKG_ROOT)/etc/iptables/
	install -m 600 -o 0 -g 0 rules4.disabled $(PKG_ROOT)/etc/iptables/
	install -m 600 -o 0 -g 0 rules6.default $(PKG_ROOT)/etc/iptables/
	install -m 600 -o 0 -g 0 rules6.disabled $(PKG_ROOT)/etc/iptables/
	install -dm 755 $(PKG_ROOT)/etc/init.d
	install -m 755 iptables $(PKG_ROOT)/etc/init.d/
	install -m 755 ip6tables $(PKG_ROOT)/etc/init.d/

