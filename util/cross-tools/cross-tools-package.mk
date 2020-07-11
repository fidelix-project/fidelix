PKG_NAME=cross-tools-$(TARGET_ARCH)
PKG_VERSION=$(OS_VERSION)
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

ifndef TARGET_ARCH
$(error Variable TARGET_ARCH must be set)
endif

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl zlib bison flex

include sysconfig.mk
include package.mk

GET_PKG_VERSION=$(shell $(MAKE) --no-print-directory -C $(OS_SRC_DIR)/$(1) show-var VARNAME=PKG_VERSION)
CONFIG=../musl-cross-make/config.mak
DESTDIR=$(PKG_ROOT)/opt/cross/$(TARGET_ARCH)

.stamp_build: Makefile
# Reset the directories
	rm -rf $(PKG_ROOT)
	mkdir -p $(DESTDIR)
# Make the config
	echo BINUTILS_VER=$(call GET_PKG_VERSION,base/binutils) > $(CONFIG)
	echo GCC_VER=$(call GET_PKG_VERSION,base/gcc) >> $(CONFIG)
	echo MUSL_VER=$(call GET_PKG_VERSION,base/musl) >> $(CONFIG)
	echo GMP_VER=$(call GET_PKG_VERSION,base/gmp) >> $(CONFIG)
	echo MPC_VER=$(call GET_PKG_VERSION,base/mpc) >> $(CONFIG)
	echo MPFR_VER=$(call GET_PKG_VERSION,base/mpfr) >> $(CONFIG)
	echo LINUX_VER=headers-$(call GET_PKG_VERSION,base/linux-headers) \
		>> $(CONFIG)
	echo GCC_CONFIG_FOR_TARGET+= \
		--enable-default-pie \
		--enable-default-ssp \
		--enable-libssp \
		--disable-libgomp \
		>> $(CONFIG)
# Build the package
	make $(MAKE_FLAGS) -C ../musl-cross-make \
		TARGET=$(TARGET_ARCH)-$(OS_NAME_LOWERCASE)-linux-musl
	make $(MAKE_FLAGS) -C ../musl-cross-make \
		TARGET=$(TARGET_ARCH)-$(OS_NAME_LOWERCASE)-linux-musl \
		OUTPUT=$(DESTDIR) \
		install
# Do not remove
	touch $@

