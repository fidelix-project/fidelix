PKG_NAME=mandoc
PKG_VERSION=1.14.5
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl zlib

PKG_WGET_URLS=https://mandoc.bsd.lv/snapshots/mandoc-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=mandoc-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=mandoc-$(PKG_VERSION)

include package.mk
include toolchain.mk

autoconf-preconfigure:
	echo 'OSNAME="$(OS_NAME) $(OS_VERSION)"' > \
		pkg_src/$(PKG_SRC_DIR)/configure.local
	echo 'PREFIX="/usr"' >> \
		pkg_src/$(PKG_SRC_DIR)/configure.local
	echo 'MANDIR="/usr/share/man"' >> \
		pkg_src/$(PKG_SRC_DIR)/configure.local
	echo 'HAVE_FTS=0' >> \
		pkg_src/$(PKG_SRC_DIR)/configure.local
	echo 'HAVE_ENDIAN=1' >> \
		pkg_src/$(PKG_SRC_DIR)/configure.local
	echo 'HAVE_NANOSLEEP=1' >> \
		pkg_src/$(PKG_SRC_DIR)/configure.local
	echo 'CC="$(TARGET_CC) $(CFLAGS)"' >> \
		pkg_src/$(PKG_SRC_DIR)/configure.local
# Fix a glitch where mandoc can't find cc
	sed -i pkg_src/$(PKG_SRC_DIR)/configure -e '/^CC=/c\CC=cc'
# Make man use less instead of more by default
	sed -i pkg_src/$(PKG_SRC_DIR)/main.c \
		-e '/pager = "more -s";/c\pager = "less -I~";'

