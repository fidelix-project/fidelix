PKG_NAME=boot-scripts
PKG_VERSION=$(OS_VERSION)
PKG_BUILD=8
PKG_BUILDSYSTEM=custom

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

include sysconfig.mk
include package.mk

TARGETS=\
	/sbin/genfstab /usr/share/man/man8/genfstab.8 \
	/etc/mdev.conf.new \
	/etc/inittab.new \
	/etc/rc.d/rc \
	/etc/rc.d/rc.shutdown

# Add any additional source files that may be modified as dependencies of this
# target.
.stamp_build: $(addprefix $(PKG_ROOT),$(TARGETS))

$(PKG_ROOT)/%:
	install -d -m 755 $@

$(PKG_ROOT)/sbin/genfstab: src/genfstab $(PKG_ROOT)/sbin
	install -m 755 $< $@

$(PKG_ROOT)/usr/share/man/man8/genfstab.8: src/genfstab.8 \
	$(PKG_ROOT)/usr/share/man/man8
	install -m 644 $< $@

$(PKG_ROOT)/etc/mdev.conf.new: src/mdev.conf $(PKG_ROOT)/etc
	install -m 644 $< $@

$(PKG_ROOT)/etc/inittab.new: src/inittab $(PKG_ROOT)/etc
	install -m 644 $< $@

$(PKG_ROOT)/etc/rc.d/rc: src/rc.d/rc $(PKG_ROOT)/etc/rc.d
	install -m 755 $< $@

$(PKG_ROOT)/etc/rc.d/rc.shutdown: src/rc.d/rc.shutdown $(PKG_ROOT)/etc/rc.d
	install -m 755 $< $@

