include sysconfig.mk
include buildconfig.mk
include toolchain.mk

_PKG_DIR:=$(OS_RELEASE_PKG_DIR)/All
_PKG_DB_DIR:=$(SYSROOT)/var/pkgdb
_PKG_FULL_NAME=$(PKG_NAME)-$(PKG_VERSION)-$(OS_ARCH)-$(OS_PKG_TAG)-$(PKG_BUILD)
_PKG_FILE_BASENAME:=$(_PKG_FULL_NAME).$(PKG_EXTENSION)
_PKG_FILE:=$(_PKG_DIR)/$(_PKG_FILE_BASENAME)
PKG_ROOT=$(CURDIR)/pkg_root
PKG_SRC=$(CURDIR)/pkg_src/$(PKG_SRC_DIR)

CMD_UPGRADEPKG=$(OS_SRC_DIR)/scripts/upgradepkg 
CMD_MAKEPKG=$(OS_SRC_DIR)/scripts/makepkg 
CMD_REMOVEPKG=$(OS_SRC_DIR)/scripts/removepkg
CMD_INSTALLPKG=$(OS_SRC_DIR)/scripts/installpkg

ifneq ($(filter $(PKG_NAME), $(ARCH_SKIP_PKGS)), )
.PHONY: default
default:
	@echo $(PKG_NAME) is not supported on $(OS_ARCH). To try to build it anyway,
	@echo explicitly run make install.
endif

ifdef PKG_BUILD_DEPENDS
$(_PKG_FILE): | .stamp_dependencies
else
$(_PKG_FILE):
endif
	$(MAKE) .stamp_build_$(_PKG_FULL_NAME)
	install -dm 755 -o 0 -g 0 $(_PKG_DIR)
# Make sure the OS_PKG_DIR is created if need be
	$(CMD_MAKEPKG) -d $(PKG_ROOT) -m $(CURDIR) -o $(_PKG_FILE)
# Update the repository metadata
	$(MAKE) update-repo-metadata

include common-rules.mk
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
reinstall: $(_PKG_FILE)
	$(CMD_UPGRADEPKG) -d $(SYSROOT) -ri $(_PKG_FILE)

.PHONY: uninstall
INSTALLED_PKG_NAME=$(shell ls $(SYSROOT)/var/pkgdb/ | \
	egrep '^$(PKG_NAME)-[^-]+-[^-]+-[^-]+-[^-]+$$')
uninstall:
ifneq "$(INSTALLED_PKG_NAME)" ""
	$(CMD_REMOVEPKG) -d $(SYSROOT) $(INSTALLED_PKG_NAME)
endif

.PHONY: print-pkgs
print-pkgs:
	@echo $(_PKG_FILE_BASENAME)

.PHONY: print-depends
print-depends:
	@echo $(PKG_NAME): $(PKG_BUILD_DEPENDS)

.stamp_dependencies: 
	cd $(OS_SRC_DIR) && $(MAKE) $(addprefix install-,$(PKG_BUILD_DEPENDS)) 
	touch $@

$(_PKG_DB_DIR)/$(_PKG_FULL_NAME): $(_PKG_FILE)
	$(CMD_UPGRADEPKG) -d $(SYSROOT) -ri $(_PKG_FILE)

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
	rm -rf $(_PKG_DIR)/$(PKG_NAME)-*.$(PKG_EXTENSION)

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
	rm -rf .stamp_*build
	rm -rf .stamp_dependencies
	rm -rf pkg_root
	rm -rf pkg_src
	rm -rf build
	rm -rf $(_PKG_DIR)/$(PKG_NAME)-*.$(PKG_EXTENSION)

