DIR:=
SUBDIRS:=\
	base \
	boot \
	util

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

include sysconfig.mk
include dir.mk

