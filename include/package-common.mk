PKG_PATCH_DIR?=$(PKG_SRC_DIR)
PKG_PATCH_BINARY?=patch

.PHONY: download
download: .stamp_download_$(PKG_NAME)-$(PKG_VERSION)

# Ignore any errors we have downloading so that the /usr/src system can still
# function in a non-networked environment where the sources were downloaded
# ahead of time. If there is actually an error downloading any of the files,
# it will cause make to abort at the verify target.
.stamp_download_$(PKG_NAME)-$(PKG_VERSION): 
	-wget $(PKG_WGET_URLS)
	touch $@

.PHONY: verify
verify: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)

.stamp_verify_$(PKG_NAME)-$(PKG_VERSION): .stamp_download_$(PKG_NAME)-$(PKG_VERSION)
	sha3sum -a 512 -c sha3-512sums
	touch $@

.SECONDARY: pkg_build_prepare
pkg_build_prepare: pkg_src_prepare pkg_root_prepare $(PKG_SRC_ARCHIVES) \
	apply-patches

.SECONDARY: pkg_src_prepare
pkg_src_prepare: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)
	rm -rf pkg_src
	mkdir -p pkg_src

.SECONDARY: $(PKG_SRC_ARCHIVES)
$(PKG_SRC_ARCHIVES): pkg_src_prepare
	tar xf $@ -C pkg_src

.PHONY: apply-patches
ifneq ($(wildcard $(CURDIR)/patches), )
apply-patches: $(addprefix apply-patch-,$(shell ls $(CURDIR)/patches))
endif
apply-patches:

.PHONY: apply-patch-%
apply-patch-%: $(PKG_SRC_ARCHIVES)
	cd pkg_src/$(PKG_PATCH_DIR) && \
		$(PKG_PATCH_BINARY) -p1 < $(CURDIR)/patches/$*

.SECONDARY: pkg_root_prepare
pkg_root_prepare: .stamp_verify_$(PKG_NAME)-$(PKG_VERSION)
	rm -rf pkg_root
	mkdir -p pkg_root

sha3-512sums:
	sha3sum -a 512 $(PKG_SRC_ARCHIVES) > sha3-512sums

