DESTDIR=/
MANDIR=$(DESTDIR)/share/man
INSTALL=install
SED=sed

VERSION:='0.0.10'

.PHONY: install
install: install-bin install-man

.PHONY: install-bin
install-bin:
	$(INSTALL) -dm 755 $(DESTDIR)/sbin
	$(INSTALL) -m 755 sbin/pkgtool $(DESTDIR)/sbin/
	$(SED)	-i $(DESTDIR)/sbin/pkgtool \
		-e "s/%PKGTOOLS_VERSION%/$(VERSION)/g"
	$(INSTALL) -m 755 sbin/installpkg $(DESTDIR)/sbin/
	$(SED)	-i $(DESTDIR)/sbin/installpkg \
		-e "s/%PKGTOOLS_VERSION%/$(VERSION)/g"
	$(INSTALL) -m 755 sbin/removepkg $(DESTDIR)/sbin/
	$(INSTALL) -m 755 sbin/upgradepkg $(DESTDIR)/sbin/
	$(INSTALL) -m 755 sbin/makepkg $(DESTDIR)/sbin/

.PHONY: install-man
install-man:
	$(INSTALL) -dm 755 $(MANDIR)/man8
	$(INSTALL) -m 644 man/pkgtool.8 $(MANDIR)/man8/
	$(INSTALL) -m 644 man/installpkg.8 $(MANDIR)/man8/
	$(INSTALL) -m 644 man/removepkg.8 $(MANDIR)/man8/
	$(INSTALL) -m 644 man/upgradepkg.8 $(MANDIR)/man8/
	$(INSTALL) -m 644 man/makepkg.8 $(MANDIR)/man8/

