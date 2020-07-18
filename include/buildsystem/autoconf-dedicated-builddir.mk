include buildconfig.mk
include package-common.mk

_AUTOCONF_HELPER_TARGETS=\
	autoconf-preconfigure \
	autoconf-premake \
	autoconf-preinstall \
	autoconf-prepackage

.PHONY: $(_AUTOCONF_HELPER_TARGETS)

.stamp_build_%: pkg_build_prepare
	mkdir -p pkg_src/build
	$(MAKE) autoconf-preconfigure
	cd pkg_src/build && ../$(PKG_SRC_DIR)/configure \
		$(AUTOCONF_CONFIGURE_ARGS) 
	$(MAKE) autoconf-premake
	cd pkg_src/build && \
		make $(AUTOCONF_MAKE_ARGS) \
		-j $(MAKE_MAXJOBS) \
		-l $(MAKE_MAXLOAD) || \
		make $(AUTOCONF_MAKE_ARGS)
	$(MAKE) autoconf-preinstall
	cd pkg_src/build && \
		make $(AUTOCONF_MAKE_INSTALL_ARGS) install DESTDIR=$(PKG_ROOT)
	$(MAKE) autoconf-prepackage
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

