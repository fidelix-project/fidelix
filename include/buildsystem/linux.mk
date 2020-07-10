# This Makefile builds a Linux kernel.

include toolchain.mk

ifeq ($(CROSS_COMPILE), y)
MAKE_ARGS+=	CROSS_COMPILE="$(CROSS_TARGET_TRIPLET)-" \
		ARCH="$(ARCH_KERNEL)"
endif

.stamp_build_%: pkg_build_prepare
	cp -uv $(KERNEL_CONFIG) pkg_src/.config
	make linux-prebuild
	make -C pkg_src $(MAKE_ARGS) $(MAKE_FLAGS)
	make linux-preinstall
	make -C pkg_src $(MAKE_ARGS) modules_install \
		INSTALL_MOD_PATH=$(PKG_ROOT)
	install -dm 755 $(PKG_ROOT)/boot
	cp -v $(PKG_SRC)/arch/$(ARCH_KERNEL)/boot/bzImage \
		$(PKG_ROOT)/boot/vmlinuz-$(PKG_VERSION)
	ln -s vmlinuz-$(PKG_VERSION) $(PKG_ROOT)/boot/vmlinuz
	cp -v $(PKG_SRC)/System.map $(PKG_ROOT)/boot/System.map-$(PKG_VERSION)
	cp -v $(PKG_SRC)/.config $(PKG_ROOT)/boot/config-$(PKG_VERSION)
	make linux-postinstall
	touch $@

ifeq "$(wildcard pkg_src/Makefile)" ""
SRC_VERSION := none
else
SRC_VERSION := $(shell make --no-print-directory -C pkg_src -s kernelversion)
endif

PKG_WGET_URLS=https://cdn.kernel.org/pub/linux/kernel/v$(PKG_MAJOR_VERSION).x/linux-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=linux-$(PKG_VERSION).tar.xz

.SECONDARY: download
download: .stamp_download_$(PKG_NAME)-$(PKG_VERSION)

# Ignore any errors we have downloading so that the /usr/src system can still
# function in a non-networked environment where the sources were downloaded
# ahead of time. If there is actually an error downloading any of the files,
# it will cause make to abort at the verify target.
.stamp_download_$(PKG_NAME)-$(PKG_VERSION): 
	-wget $(PKG_WGET_URLS)
	touch $@

.SECONDARY: verify
verify: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)

.stamp_verify_$(PKG_NAME)-$(PKG_VERSION): .stamp_download_$(PKG_NAME)-$(PKG_VERSION)
	sha3sum -a 512 -c sha3-512sums
	touch $@

.SECONDARY: pkg_src_prepare
pkg_src_prepare: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)
	[ ! -e pkg_src ] || mv -f pkg_src pkg_src_prev

.SECONDARY: $(PKG_SRC_ARCHIVES)
$(PKG_SRC_ARCHIVES): pkg_src_prepare
	tar xf $@
	mv linux-$(PKG_VERSION) pkg_src
	make -C pkg_src mrproper

ifneq "$(PKG_VERSION)" "$(SRC_VERSION)"

ifdef PRINT_KERNEL_INFO
$(info Rebuilding kernel source tree: current tree version ($(SRC_VERSION)) \
does not match the package version ($(PKG_VERSION)).)
endif

.SECONDARY: pkg_build_prepare
pkg_build_prepare: pkg_src_prepare pkg_root_prepare $(PKG_SRC_ARCHIVES)

else

ifdef PRINT_KERNEL_INFO
$(info Using in place kernel source tree)
endif

.SECONDARY: pkg_build_prepare
pkg_build_prepare: pkg_root_prepare

endif

.SECONDARY: pkg_root_prepare
pkg_root_prepare: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)
	rm -rf pkg_root
	mkdir -p pkg_root

sha3-512sums:
	sha3sum -a 512 $(PKG_SRC_ARCHIVES) > sha3-512sums

