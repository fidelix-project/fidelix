# This Makefile does not actually do much. It just includes the common package
# make rules It exists so that package Makefiles that need to use a
# non-standard build process can specify PKG_BUILDSYSTEM=custom-common and then
# implement their build process by defining the .stamp_custom_build target in
# their package Makefile.
#
# Unlike custom.mk, this buildsystem Makefile still allows for downloading,
# verifying, and extracting package sources automatically by using the
# PKG_WGET_URLS, PKG_SRC_ARCHIVES, and PKG_SRC_DIR variables and the
# sha3-512sums file.

include package-common.mk

.stamp_build_%: .stamp_custom_build
	touch $@

.PHONY: stamp_custom_build
.stamp_custom_build: pkg_build_prepare

