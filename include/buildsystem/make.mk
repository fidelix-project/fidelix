include buildconfig.mk
include package-common.mk

_MAKE_HELPER_TARGETS=\
	make-preconfigure \
	make-premake \
	make-preinstall \
	make-prepackage

.PHONY: $(_make_HELPER_TARGETS)

.stamp_build_%: pkg_build_prepare
	make make-premake
	cd pkg_src/$(PKG_SRC_DIR); \
		make $(MAKE_ARGS) \
		-j $(MAKE_MAXJOBS) \
		-l $(MAKE_MAXLOAD)
	make make-preinstall
	cd pkg_src/$(PKG_SRC_DIR); \
		make $(MAKE_INSTALL_ARGS) install DESTDIR=$(PKG_ROOT)
	make make-prepackage
	touch $@

# Commands to run before make
make-premake-default:

# Commands to run after make, but before make install
make-preinstall-default:

# Commands to run after make install, but before the final package is created
make-prepackage-default:

make-%: make-%-default

