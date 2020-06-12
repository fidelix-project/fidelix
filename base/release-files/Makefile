include sysconfig.mk

PKG_NAME=release-files
PKG_VERSION=$(OS_FULL_VERSION)
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

include package.mk

LSB_RELEASE=$(PKG_ROOT)/etc/lsb-release
OS_RELEASE=$(PKG_ROOT)/etc/os-release

.stamp_build:
	rm -rf $(PKG_ROOT)
	mkdir -p $(PKG_ROOT)/etc
	echo 'DISTRIB_ID="$(OS_NAME)"' > $(LSB_RELEASE)
	echo 'DISTRIB_RELEASE="$(OS_FULL_VERSION)"' >> $(LSB_RELEASE)
	echo 'DISTRIB_CODENAME="$(OS_RELEASE_NAME)"' >> $(LSB_RELEASE)
	echo 'DISTRIB_DESCRIPTION="$(OS_DESCRIPTION)"' >> $(LSB_RELEASE)

	echo 'NAME=$(OS_NAME)' > $(OS_RELEASE)
	echo 'VERSION="$(OS_FULL_VERSION) ($(OS_RELEASE_NAME))"' \
		>> $(OS_RELEASE)
	echo 'ID=$(OS_NAME_LOWERCASE)' >> $(OS_RELEASE)
	echo 'VERSION_ID=$(OS_FULL_VERSION)' >> $(OS_RELEASE)
	echo 'PRETTY_NAME="$(OS_NAME) $(OS_FULL_VERSION) ($(OS_RELEASE_NAME))"' \
		>> $(OS_RELEASE)
	touch $@

