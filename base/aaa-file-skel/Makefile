PKG_NAME=aaa-file-skel
PKG_VERSION=$(OS_VERSION)
PKG_BUILD=2
PKG_BUILDSYSTEM=custom

include sysconfig.mk
include package.mk

.stamp_build: doinst.sh Makefile
	make clean
	mkdir -p $(PKG_ROOT)/etc
	install -m 644 etc.protocols $(PKG_ROOT)/etc/protocols
	install -m 644 etc.services $(PKG_ROOT)/etc/services
	touch $@

