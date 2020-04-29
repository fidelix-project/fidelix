# Package selection for a basic system. Includes everything necessary to run
# Fidelix; however, it does not include the development packages and is not
# sufficient to compile the system. It is sufficient to run a `make install`
# from /usr/src if the binary packages are already there.

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
        perl \
        mandoc \
        man-pages \
        zoneinfo \
        ncurses \
        kmod \
	boot \
	blkid \
	util \
	libgcc

