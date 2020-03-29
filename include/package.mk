include sysconfig.mk
include buildconfig.mk

_PKG_DB_DIR:=/var/pkgdb
_PKG_FULL_NAME=$(PKG_NAME)-$(PKG_VERSION)-$(OS_ARCH)-$(OS_PKG_TAG)-$(PKG_BUILD)
_PKG_FILE=$(_PKG_FULL_NAME).$(PKG_EXTENSION)
PKG_ROOT=$(CURDIR)/pkg_root

ifdef PKG_BUILD_DEPENDS
$(_PKG_FILE): .stamp_dependencies .stamp_build
	makepkg -d $(PKG_ROOT) -m $(CURDIR) -o $(_PKG_FILE)
else
$(_PKG_FILE): .stamp_build
	makepkg -d $(PKG_ROOT) -m $(CURDIR) -o $(_PKG_FILE)
endif

include buildsystem/$(PKG_BUILDSYSTEM).mk

.PHONY: package
package: $(_PKG_FILE)

.PHONY: build
build: $(_PKG_FILE)

.PHONY: install
ifeq "$(wildcard $(_PKG_DB_DIR)/$(_PKG_FULL_NAME))" ""
install: $(_PKG_DB_DIR)/$(_PKG_FULL_NAME)
else
install:
endif

.PHONY: reinstall
reinstall: $(_PKG_DB_DIR)/$(_PKG_FULL_NAME)

.stamp_dependencies: 
	cd $(OS_SRC_DIR); make $(addprefix install-,$(PKG_BUILD_DEPENDS)) 
	touch $@

$(_PKG_DB_DIR)/$(_PKG_FULL_NAME): $(_PKG_FILE)
	upgradepkg -ri $(CURDIR)/$(_PKG_FILE)

.PHONY: clean
clean:
	rm -rf .stamp_*
	rm -rf pkg_root
	rm -rf pkg_src
	rm -rf build
	rm -rf *.$(PKG_EXTENSION)
	rm -rf *.tar
	rm -rf *.tar.gz
	rm -rf *.tar.xz
	rm -rf *.tar.bz2
ifdef PKG_FILES
	rm -rf $(PKG_FILE)
endif

.PHONY: tidy
tidy:
	rm -rf .stamp_*build
	rm -rf .stamp_download*
	rm -rf .stamp_verify*
	rm -rf pkg_root
	rm -rf pkg_src
	rm -rf build
	rm -rf *.tar
	rm -rf *.tar.gz
	rm -rf *.tar.xz
	rm -rf *.tar.bz2

.PHONY: neat
neat:
	rm -rf .stamp_*build
	rm -rf pkg_root
	rm -rf pkg_src
	rm -rf build

.PHONY: scrub
scrub:
	touch .stamp_verify*
	rm -rf .stamp_*build
	rm -rf .stamp_dependencies
	rm -rf pkg_root
	rm -rf pkg_src
	rm -rf build
	rm -rf *.$(PKG_EXTENSION)

