# Package selection for a minimal functional system. Includes only what is
# necessary to run Fidelix. You will likely want more packages for it to be
# useful.
#
# It is capable of performing a `make install` from /usr/src if the binary
# packages are already there.

SELECTED_PACKAGES=\
	aaa-directory-skel \
        aaa-file-skel \
        linux-headers \
        pkgtools \
        musl \
        zlib \
        libstdcxx \
        libressl \
        system-scripts \
        busybox \
        make \
        zoneinfo \
        ncurses \
	release-files \
	boot

