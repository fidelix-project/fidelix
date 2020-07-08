PKG_NAME=ncurses
PKG_VERSION=6.2
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=http://ftp.gnu.org/gnu/ncurses/ncurses-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=ncurses-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=ncurses-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--with-shared \
	--without-debug \
	--without-normal \
	--enable-widec \
	--build=$(CROSS_HOST_TRIPLET) \
	--host=$(CROSS_TARGET_TRIPLET)

include package.mk

# Force applications to link against ncursesw
autoconf-prepackage: $(addprefix ncursesw-fakeout-, ncurses form panel menu)
# Make sure that programs that look for -lcurses are still able to build
	rm -vf $(PKG_ROOT)/usr/lib/libcursesw.so
	echo "INPUT(-lncursesw)" > $(PKG_ROOT)/usr/lib/libcursesw.so
	ln -sfv libncurses.so $(PKG_ROOT)/usr/lib/libcurses.so
# Remove the clear and reset binaries (we use the one provided by BusyBox)
	rm $(PKG_ROOT)/usr/bin/clear
	rm $(PKG_ROOT)/usr/bin/reset

# Force a package to link against ncursesw instead of ncurses
.PHONY: ncurses-fakeout-%
ncursesw-fakeout-%:
	echo "INPUT(-l$*w)" > $(PKG_ROOT)/usr/lib/lib$*.so
#	ln -sfv $*w.pc $(PKG_ROOT)/usr/lib/pkgconfig/$*.pc
	

