PKG_NAME=system-scripts
PKG_VERSION=$(OS_VERSION)
PKG_BUILD=4
PKG_BUILDSYSTEM=custom

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

include sysconfig.mk
include package.mk

TARGETS=\
	/sbin/service /usr/share/man/man8/service.8 \
	/etc/init.d/common-core \
	/etc/init.d/sample \
	/sbin/sysconfig /usr/share/man/man8/sysconfig.8 \
	$(addprefix /etc/sysconfig.d/,hostname initial root-password timezone)

# Add any additional source files that may be modified as dependencies of this
# target.
.stamp_build: $(addprefix $(PKG_ROOT),$(TARGETS))

$(PKG_ROOT)/sbin/service: src/service $(PKG_ROOT)/sbin.dir
	install -m 755 $< $@

$(PKG_ROOT)/sbin/sysconfig: src/sysconfig $(PKG_ROOT)/sbin.dir
	install -m 755 $< $@

$(PKG_ROOT)/usr/share/man/man8/%.8: src/%.8 \
	$(PKG_ROOT)/usr/share/man/man8.dir
	install -m 644 $< $@

$(PKG_ROOT)/etc/init.d/%: src/init.d/% $(PKG_ROOT)/etc/init.d.dir
	install -m 644 $< $@

$(PKG_ROOT)/etc/sysconfig.d/%: src/sysconfig.d/% $(PKG_ROOT)/etc/sysconfig.d.dir
	install -m 755 $< $@

$(PKG_ROOT)/%.dir:
	install -d -m 755 $(PKG_ROOT)/$*

