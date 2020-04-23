include buildconfig.mk
include package-common.mk

_AUTOCONF_HELPER_TARGETS=\
	autoconf-preconfigure \
	autoconf-premake \
	autoconf-preinstall \
	autoconf-prepackage

.PHONY: $(_AUTOCONF_HELPER_TARGETS)

.stamp_build: pkg_build_prepare
	make autoconf-preconfigure
	cd pkg_src/$(PKG_SRC_DIR); ./configure \
		$(AUTOCONF_CONFIGURE_ARGS) 
	make autoconf-premake
	cd pkg_src/$(PKG_SRC_DIR); \
		make $(AUTOCONF_MAKE_ARGS) \
		-j $(MAKE_MAXJOBS) \
		-l $(MAKE_MAXLOAD)
	make autoconf-preinstall
ifneq ($(AUTOCONF_SKIP_MAKE_INSTALL), y)
	cd pkg_src/$(PKG_SRC_DIR); \
		make $(AUTOCONF_MAKE_INSTALL_ARGS) install DESTDIR=$(PKG_ROOT)
endif
	make autoconf-prepackage
	touch $@

# Commands to run before ./configure
autoconf-preconfigure-default:

# Commands to run after ./configure, but before make
autoconf-premake-default:

# Commands to run after make, but before make install
autoconf-preinstall-default:

# Commands to run after make install, but before the final package is created
autoconf-prepackage-default:

autoconf-%: autoconf-%-default

