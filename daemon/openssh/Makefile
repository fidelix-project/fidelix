PKG_NAME=openssh
PKG_VERSION=8.2p1
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl libressl

PKG_WGET_URLS=https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=openssh-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=openssh-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc/ssh \
	--localstatedir=/var \
	--disable-static \
	--with-privsep-user=_sshd \
	--build=$(OS_TARGET_TRIPLET)

include package.mk

# Commands to run after make install
autoconf-prepackage:
	install -v -m755 $(PKG_SRC)/contrib/ssh-copy-id \
		$(PKG_ROOT)/usr/bin
	install -v -m644 $(PKG_SRC)/contrib/ssh-copy-id.1 \
		$(PKG_ROOT)/usr/share/man/man1
	install -dm 755 $(PKG_ROOT)/var/empty
# Install the Init Script
	install -dm 755 $(PKG_ROOT)/etc/init.d
	install -m 755 sshd $(PKG_ROOT)/etc/init.d/

