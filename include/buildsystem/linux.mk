# This Makefile builds a Linux kernel.

.SECONDARY: .stamp_build
.stamp_build: pkg_build_prepare
	cp -v $(KERNEL_CONFIG) pkg_src/.config
	make linux-prebuild
	make -C pkg_src $(MAKE_FLAGS)
	make linux-preinstall
	make -C pkg_src modules_install DESTDIR=$(PKG_ROOT)
	make -C pkg_src install DESTDIR=$(PKG_ROOT)
	make linux-postinstall

ifeq "$(wildcard pkg_src/Makefile)" ""
SRC_VERSION := 0
else
SRC_VERSION := $(shell cd pkg_src; make -s kernelversion)
endif

ifneq "$(PKG_VERSION)" "$(SRC_VERSION)"

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

.SECONDARY: pkg_build_prepare
pkg_build_prepare: pkg_src_prepare pkg_root_prepare $(PKG_SRC_ARCHIVES)

.SECONDARY: pkg_src_prepare
pkg_src_prepare: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)
	rm -rf pkg_src

.SECONDARY: $(PKG_SRC_ARCHIVES)
$(PKG_SRC_ARCHIVES): pkg_src_prepare
	tar xf $@
	mv linux-$(PKG_VERSION) pkg_src
	make -C pkg_src mrproper

else

.SECONDARY: pkg_build_prepare
pkg_build_prepare: pkg_root_prepare

endif

.SECONDARY: pkg_root_prepare
pkg_root_prepare: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)
	rm -rf pkg_root
	mkdir -p pkg_root

sha3-512sums:
	sha3sum -a 512 $(PKG_SRC_ARCHIVES) > sha3-512sums

