ifndef _INC_DIR
_INC_DIR:=included

include sysconfig.mk

DIR_TARGETS:=$(PACKAGES) $(SUBDIRS)

.PHONY: build
build: $(addprefix build-,$(DIR_TARGETS))

.PHONY: build-%
build-%:
	make -C $*

.PHONY: tidy-%
tidy-%:
	make -C $* tidy

.PHONY: tidy
tidy: $(addprefix tidy-,$(DIR_TARGETS))

.PHONY: neat-%
neat-%:
	make -C $* neat

.PHONY: neat
neat: $(addprefix neat-,$(DIR_TARGETS))

.PHONY: scrub-%
scrub-%:
	make -C $* scrub

.PHONY: scrub
scrub: $(addprefix scrub-,$(DIR_TARGETS))

.PHONY: clean-%
clean-%:
	make -C $* clean

.PHONY: clean
clean: $(addprefix clean-,$(DIR_TARGETS))

.PHONY: download-%
download-%:
	make -C $* download

.PHONY: download
download: $(addprefix download-,$(DIR_TARGETS))

.PHONY: verify-%
verify-%:
	make -C $* verify

.PHONY: verify
verify: $(addprefix verify-,$(DIR_TARGETS))

.PHONY: install-%
install-%:
	make -C $* install

.PHONY: install
install: $(addprefix install-,$(DIR_TARGETS))

.PHONY: reinstall-%
reinstall-%:
	make -C $* reinstall

.PHONY: reinstall
reinstall: $(addprefix reinstall-,$(DIR_TARGETS))

undefine PACKAGES

endif

ifndef DIR_INC_$(DIR)
DIR_INC_$(DIR)=included

ifdef PACKAGES

.PHONY: $(addprefix clean-,$(PACKAGES))
$(addprefix clean-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix tidy-,$(PACKAGES))
$(addprefix tidy-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix neat-,$(PACKAGES))
$(addprefix neat-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix scrub-,$(PACKAGES))
$(addprefix scrub-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix download-,$(PACKAGES))
$(addprefix download-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix verify-,$(PACKAGES))
$(addprefix verify-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix build-,$(PACKAGES))
$(addprefix build-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix install-,$(PACKAGES))
$(addprefix install-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

.PHONY: $(addprefix reinstall-,$(PACKAGES))
$(addprefix reinstall-,$(PACKAGES)):
	make -C $(OS_SRC_DIR)/$(DIR) $@

endif

ifdef SUBDIRS
include $(addsuffix /Makefile,$(SUBDIRS))
endif

endif

