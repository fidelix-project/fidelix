include sysconfig.mk

LSB_RELEASE=$(SYSROOT)/etc/lsb-release
OS_RELEASE=$(SYSROOT)/etc/os-release

install:
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

# Don't error on make clean, etc
.PHONY: download verify build clean scrub neat tidy
download verify build clean scrub neat tidy:
	exit 0

