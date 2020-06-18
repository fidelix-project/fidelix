PKG_NAME=aaa-directory-skel
PKG_VERSION=$(OS_VERSION)
PKG_BUILD=1
PKG_BUILDSYSTEM=custom

include sysconfig.mk
include package.mk

.stamp_build: description Makefile
	make clean

	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/bin
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/boot
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/dev
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/etc
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/home
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/lib
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/media
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/mnt
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/opt
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/proc
	install -d -m 700 -o 0 -g 0 $(PKG_ROOT)/root
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/run
	install -d -m 1777 -o 0 -g 0 $(PKG_ROOT)/run/lock
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/srv
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/sys
	install -d -m 1777 -o 0 -g 0 $(PKG_ROOT)/tmp
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var
ifneq ($(ARCH_LIBDIR_SUFFIX),)
	ln -s lib $(PKG_ROOT)/lib$(ARCH_LIBDIR_SUFFIX)
endif

	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/bin
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/include
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/lib
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/lib/pkgconfig
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/libexec
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/sbin
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/src
ifneq ($(ARCH_LIBDIR_SUFFIX),)
	ln -s lib $(PKG_ROOT)/usr/lib$(ARCH_LIBDIR_SUFFIX)
endif

	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/bin
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/include
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/lib
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/sbin
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/src
ifneq ($(ARCH_LIBDIR_SUFFIX),)
	ln -s lib $(PKG_ROOT)/usr/local/lib$(ARCH_LIBDIR_SUFFIX)
endif

	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/color
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/dict
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/doc
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/info
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/locale
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man1
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man2
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man3
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man4
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man5
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man6
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man7
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/man/man8
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/misc
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/terminfo
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/share/zoneinfo

	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/color
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/dict
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/doc
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/info
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/locale
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man1
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man2
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man3
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man4
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man5
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man6
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man7
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/man/man8
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/misc
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/terminfo
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/usr/local/share/zoneinfo

	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/cache
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/lib
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/lib/color
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/lib/misc
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/lib/locate
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/local
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/log
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/opt
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/mail
	install -d -m 755 -o 0 -g 0 $(PKG_ROOT)/var/spool
	install -d -m 1755 -o 0 -g 0 $(PKG_ROOT)/var/tmp
	ln -s /run $(PKG_ROOT)/var/run
	ln -s /run/lock $(PKG_ROOT)/var/lock

	touch $@

