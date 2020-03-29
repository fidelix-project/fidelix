DIR:=
SUBDIRS:=\
	base

# Handle bootstrapping targets
.PHONY: bootstrap-%
bootstrap-%:
	make -C bootstrap $@

.PHONY: from-bootstrap
from-bootstrap:
	make -C bootstrap/packages

include dir.mk

