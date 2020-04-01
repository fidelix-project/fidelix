PKG_NAME=man-pages
PKG_VERSION=5.05
PKG_BUILD=1
PKG_BUILDSYSTEM=custom-common

# Build time dependencies for this package
PKG_BUILD_DEPENDS=

# The URLs of the source archives. Specify multiple URLS as a space separated
# list.
PKG_WGET_URLS=https://www.kernel.org/pub/linux/docs/man-pages/man-pages-$(PKG_VERSION).tar.xz
# The file names of the source archives. Specify multiple files as a space
# separated list.
PKG_SRC_ARCHIVES=man-pages-$(PKG_VERSION).tar.xz
# The package source directory, as it appears in the source archives
PKG_SRC_DIR=man-pages-$(PKG_VERSION)

# Add any additional argument that should be passed to make here
MAKE_ARGS=
# Add any additional argument that should be passed to make install here
MAKE_INSTALL_ARGS=

include package.mk

.stamp_custom_build:
	make -C pkg_src/$(PKG_SRC_DIR) install DESTDIR=$(PKG_ROOT)
	touch $@

