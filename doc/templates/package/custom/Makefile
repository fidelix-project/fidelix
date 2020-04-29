PKG_NAME=package
PKG_VERSION=1.0
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

include sysconfig.mk
include package.mk

# Add any additional source files that may be modified as dependencies of this
# target.
.stamp_build: Makefile
	# Put any custom commands here. The package should be installed to the
	# $(PKG_ROOT) directory. You need only install the files to this
	# director; the /usr/src system will take care of creating the package.
	# Other files (README.install, doinst.sh, etc) should be placed in this
	# directory. Make sure not to remove the touch $@
	touch $@

