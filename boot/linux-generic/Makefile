PKG_NAME=linux-generic
PKG_MAJOR_VERSION=5
PKG_VERSION=5.4.29
PKG_BUILD=1
PKG_BUILDSYSTEM=linux

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl flex bison libelf

include sysconfig.mk
include package.mk

# The .config file to use when building this kernel. Required
KERNEL_CONFIG=config/config-$(OS_ARCH)

# Runs before make
linux-prebuild:

# Runs afer make, before make install
linux-preinstall:

# Runs after mak install, before package creation
linux-postinstall:

