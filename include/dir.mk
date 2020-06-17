ifndef _INC_DIR
_INC_DIR:=y

include sysconfig.mk

DEFAULT_PACKAGES?=$(PACKAGES) $(TARGETS)
DIR_TARGETS:=$(DEFAULT_PACKAGES) $(SUBDIRS)
CLEANING_TARGETS:=$(PACKAGES) $(SUBDIRS) $(TARGETS)

.PHONY: build 
build: $(addprefix build-,$(DIR_TARGETS))
world: $(addprefix world-,$(PACKAGES)) $(addprefix worlddir-,$(SUBDIRS))

.PHONY: build-%
build-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*)

.PHONY: world-%
world-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*)

.PHONY: worlddir-%
worlddir-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) world

.PHONY: tidy-%
tidy-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) tidy

.PHONY: tidy
tidy: $(addprefix tidy-,$(CLEANING_TARGETS))

.PHONY: neat-%
neat-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) neat

.PHONY: neat
neat: $(addprefix neat-,$(CLEANING_TARGETS))

.PHONY: scrub-%
scrub-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) scrub

.PHONY: scrub
scrub: $(addprefix scrub-,$(CLEANING_TARGETS))

.PHONY: clean-%
clean-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) clean

.PHONY: clean
clean: $(addprefix clean-,$(CLEANING_TARGETS))

.PHONY: download-%
download-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) download

.PHONY: download
download: $(addprefix download-,$(DIR_TARGETS))

.PHONY: verify-%
verify-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) verify

.PHONY: verify
verify: $(addprefix verify-,$(DIR_TARGETS))

.PHONY: install-%
install-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) install

.PHONY: install
install: $(addprefix install-,$(DIR_TARGETS))

.PHONY: reinstall-%
reinstall-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) reinstall

.PHONY: reinstall
reinstall: $(addprefix reinstall-,$(DIR_TARGETS))

.PHONY: uninstall-%
uninstall-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	make -C $(DIR_PKG_$*) uninstall

.PHONY: uninstall
uninstall: $(addprefix uninstall-,$(DIR_TARGETS))

.PHONY: print-pkgs-%
print-pkgs-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	@make -C $(DIR_PKG_$*) print-pkgs

.PHONY: print-pkgs
print-pkgs: $(addprefix print-pkgs-,$(PACKAGES) $(SUBDIRS))

.PHONY: print-depends-%
print-depends-%:
	@[ ! -z "$(DIR_PKG_$*)" ] || (echo $*: package not found && exit 1)
	@make -C $(DIR_PKG_$*) print-depends

.PHONY: print-depends
print-depends: $(addprefix print-depends-,$(PACKAGES) $(SUBDIRS))

endif

ifndef DIR_INC_$(DIR)
DIR_INC_$(DIR)=included

ifdef PACKAGES
$(foreach pkg,$(PACKAGES),$(eval DIR_PKG_$(pkg):=$(OS_SRC_DIR)/$(DIR)/$(pkg)))
PACKAGES:=
endif

ifdef TARGETS
$(foreach pkg,$(TARGETS),$(eval DIR_PKG_$(pkg):=$(OS_SRC_DIR)/$(DIR)/$(pkg)))
TARGETS:=
endif

ifdef SUBDIRS
$(foreach pkg,$(SUBDIRS),$(eval DIR_PKG_$(pkg):=$(OS_SRC_DIR)/$(DIR)/$(pkg)))
include $(addsuffix /Makefile,$(SUBDIRS))
endif

endif

