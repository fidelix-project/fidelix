DIR:=util/cross-tools

# Packages contained in this directory
PACKAGES= \
	cross-tools-x86_64 \
	cross-tools-i686 \
	cross-tools-aarch64

# Non-package subdirectories contained in this directory that should be
# included when searching for packages
SUBDIRS=

# Subdirectories that should have Make run on them but do not produce binary
# packages.
TARGETS=

# Subdirectories that should be cleaned (including scrub, neat, and tidy
# targets), but should not otherwise have make run on them.
TARGETS_TO_CLEAN= musl-cross-make

include dir.mk

