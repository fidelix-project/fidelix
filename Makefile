OS_SRC_DIR?=$(CURDIR)
DIR:=
SUBDIRS:=\
	base \
	boot \
	util \
	daemon

.PHONY: default
default: install

# Handle bootstrapping targets
.PHONY: bootstrap-%
bootstrap-%:
	make -C bootstrap $@

.PHONY: from-bootstrap
from-bootstrap:
	make -C bootstrap/packages

# Handle /usr/src copying
copy-src:
	cp -au $(OS_SRC_DIR)/* $(SYSROOT)/usr/src/

# Handle package selections
ifdef SELECTION
ifneq ($(wildcard include/selection/$(SELECTION).local.mk), )
include include/selection/$(SELECTION).local.mk
else ifneq ($(wildcard include /selection/$(SELECTION).mk), )
include include/selection/$(SELECTION).mk
endif
endif
.PHONY: install-selection
install-selection: $(addprefix install-,$(SELECTED_PACKAGES))

include sysconfig.mk
include dir.mk

