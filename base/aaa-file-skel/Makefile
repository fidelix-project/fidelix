PKG_NAME=aaa-file-skel
PKG_VERSION=$(OS_VERSION)
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

include sysconfig.mk
include package.mk

.stamp_build: doinst.sh Makefile
	make clean
	touch $@

