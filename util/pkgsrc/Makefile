include sysconfig.mk
include depends.mk

VERSION=stable
URL=https://github.com/fidelix-project/pkgsrc/archive/master.tar.gz
ARCHIVE_FILE=master.tar.gz
PREFIX=/usr/pkg
PREFIX_BASE=/usr

install: | extract bootstrap setup
update: | extract setup

.PHONY: extract bootstrap setup
extract: download
	install -dm 755 $(PREFIX)
	tar xf $(ARCHIVE_FILE) -C $(PREFIX_BASE)
	cd $(PREFIX_BASE) && mv pkgsrc-master pkgsrc

bootstrap: package-bsdtar
	cd $(PREFIX_BASE)/pkgsrc/bootstrap && ./bootstrap
	cat mk.tail.conf >> $(PREFIX)/etc/mk.conf

setup:
	install -m 644 mk.fidelix.conf $(PREFIX)/etc/mk.fidelix.conf
	cp -R usr-pkg-skel/* $(PREFIX)/
	

.SECONDARY: download
download: $(ARCHIVE_FILE)

$(ARCHIVE_FILE):
	wget $(URL)

.PHONY: clean tidy neat scrub
clean tidy:
	rm -f "$(ARCHIVE_FILE)"

neat scrub:

.SECONDARY: lists
lists: $(OS_ARCH)-supported-packages.txt

.PHONY: bulk
bulk: $(addprefix pkgsrc/,$(shell cat $(OS_ARCH)-target-packages.txt))

$(OS_ARCH)-supported-packages.txt:
	ls /usr/pkgsrc/packages/All | rev | cut -d - -f 2- | rev > $@

config.local.mk:
	@echo -n

pkgsrc/%:
	cd $(PREFIX_BASE)/pkgsrc/$* && \
		bmake install && \
		bmake package && \
		bmake clean-depends

