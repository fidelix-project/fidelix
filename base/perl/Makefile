PKG_NAME=perl
PKG_VERSION=5.30.3
PKG_BUILD=1
PKG_BUILDSYSTEM=custom-common

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS=https://www.cpan.org/src/5.0/perl-$(PKG_VERSION).tar.xz
PKG_SRC_ARCHIVES=perl-$(PKG_VERSION).tar.xz
PKG_SRC_DIR=perl-$(PKG_VERSION)

include package.mk

# By default Perl builds the Compress::Raw::Zlib and modules. By default Perl
# will use an internal copy of the sources for the build. Set the following
# variables so that Perl will use the libraries installed on the system:
export BUILD_ZLIB=False

# Put custom build rules here. This target runs with $PWD set to the directory
# of this Makefile. Do NOT delete the touch $@.
.stamp_custom_build:
	cd pkg_src/$(PKG_SRC_DIR); sh Configure -des \
		-Dprefix=/usr \
		-Dvendorprefix=/usr \
		-Dman1dir=/usr/share/man/man1 \
		-Dman3dir=/usr/share/man/man3 \
		-Dpager="/usr/bin/less -IR"  \
		-Duseshrplib 
	cd pkg_src/$(PKG_SRC_DIR); make $(MAKE_FLAGS)
	cd pkg_src/$(PKG_SRC_DIR); make install DESTDIR=$(PKG_ROOT)
	touch $@

