PKG_NAME=perl
PKG_VERSION=5.30.3
PERL_CROSS_VERSION=1.3.4
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl

PKG_WGET_URLS= \
	https://www.cpan.org/src/5.0/perl-$(PKG_VERSION).tar.xz \
	https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)/perl-cross-$(PERL_CROSS_VERSION).tar.gz
PKG_SRC_ARCHIVES= \
	perl-$(PKG_VERSION).tar.xz \
	perl-cross-$(PERL_CROSS_VERSION).tar.gz
PKG_SRC_DIR=perl-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS= \
	--prefix=/usr \
	--sysroot=$(SYSROOT) \
	--build=$(CROSS_HOST_TRIPLET) \
	--target=$(CROSS_TARGET_TRIPLET) \
	--man1dir=/usr/share/man/man1 \
	--man3dir=/usr/share/man/man3 \
	-Dpager="/usr/bin/less -IR"  \
	-Duseshrplib

include package.mk

# By default Perl builds the Compress::Raw::Zlib and modules. By default Perl
# will use an internal copy of the sources for the build. Set the following
# variables so that Perl will use the libraries installed on the system:
export BUILD_ZLIB=False

autoconf-preconfigure:
	cp -Rv pkg_src/perl-cross-$(PERL_CROSS_VERSION)/* \
		pkg_src/$(PKG_SRC_DIR)/

