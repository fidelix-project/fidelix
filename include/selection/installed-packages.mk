# Special package selection that selects all of the packages that are currently
# installed. Useful for upgrading the system.

SELECTED_PACKAGES=$(shell ls $(SYSROOT)/var/pkgdb/ | rev | cut -d - -f 5- | rev)

