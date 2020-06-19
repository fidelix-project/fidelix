include sysconfig.mk
include bsconfig.mk

export OS_PKG_TAG

BSPACKAGES=\
	aaa-directory-skel \
	aaa-file-skel \
	pkgtools \
	.stamp_temporary_symlinks \
	linux-headers \
	musl \
	.stamp_adjust_toolchain \
	.stamp_check_toolchain \
	zlib \
	binutils \
	m4 \
	gmp \
	mpfr \
	mpc \
	.stamp-temporary-libstdcxx \
	.stamp-temporary-gcc \
	gcc \
	.stamp-remove-temporary-libstdcxx \
	.stamp-remove-temporary-gcc \
	busybox \
	make \
	perl \
	texinfo

.PHONY: install
install: packages cleanup-tools

.PHONY: packages
packages: .stamp_packages

.stamp_packages:
	make $(BSPACKAGES)
	touch $@

.PHONY: cleanup-tools
cleanup-tools: .stamp_cleanup_tools

.stamp_cleanup_tools: .stamp_packages
	make -C "$(OS_SRC_DIR)" neat
	mv $(PREFIX) $(PREFIX).disabled
	@echo The bootstrap tools have been disabled and moved to $(PREFIX).disabled.
	@echo Assuming everything went well, it is safe to remove this directory.
	@echo
	@echo '*** It is now safe to make install your system ***'
	@echo
	touch $@

.stamp_temporary_symlinks:
	ln -svf $(PREFIX)/bin/sh /bin
	ln -sv $(PREFIX)/bin/cat /bin
	ln -sv $(PREFIX)/bin/dd /bin
	ln -sv $(PREFIX)/bin/echo /bin
	ln -sv $(PREFIX)/bin/ln /bin
	ln -sv $(PREFIX)/bin/pwd /bin
	ln -sv $(PREFIX)/bin/rm /bin
	ln -sv $(PREFIX)/bin/stty /bin
	ln -sv $(PREFIX)/bin/perl /usr/bin
	ln -sv $(PREFIX)/bin/install /usr/bin

	ln -sv $(PREFIX)/lib/libgcc_s.so /usr/lib
	ln -sv $(PREFIX)/lib/libgcc_s.so.1 /usr/lib
	ln -sv $(PREFIX)/lib/libstdc++.a /usr/lib
	ln -sv $(PREFIX)/lib/libstdc++.so /usr/lib
	ln -sv $(PREFIX)/lib/libstdc++.so.6 /usr/lib
	install -m 755 cpp-shim /lib/cpp

	touch $@

.stamp_adjust_toolchain: $(addprefix $(PREFIX)/stamp_adjust_toolchain_, ld gcc )
	touch $@

$(PREFIX)/stamp_adjust_toolchain_ld:
	mv -v $(PREFIX)/bin/ld $(PREFIX)/bin/ld-old
	mv -v $(PREFIX)/bin/ld-new $(PREFIX)/bin/ld
	mv -v $(PREFIX)/$(TARGET)/bin/ld $(PREFIX)/$(TARGET)/bin/ld-old
	ln -sv $(PREFIX)/bin/ld $(PREFIX)/$(TARGET)/bin/ld
	touch $@

$(PREFIX)/stamp_adjust_toolchain_gcc:
	$(PREFIX)/bin/gcc -dumpspecs | sed \
		-e 's@/$(PREFIX)@@g' \
		-e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
		-e '/\*cpp:/{n;s@$$@ -isystem /usr/include@}' \
		> `dirname $$(gcc --print-libgcc-file-name)`/specs
	touch $@

.SECONDARY: check_toolchain
check_toolchain: .stamp_check_toolchain

.stamp_check_toolchain:
	@echo Checking that the C compiler and linker work
	cc check_toolchain.c -v -Wl,--verbose &> check_toolchain.log
	@echo Checking for the correct dynamic linker in ELF header
	readelf -l a.out | grep 'Requesting program interpreter: /lib/ld-musl-'
	@echo Checking that correct dynamic linker is being loaded
	ldd a.out | grep '^\t/lib/ld-musl'
	@echo Checking that the correct C runtime is being used
	grep '/usr/lib.*/crt1.*succeeded' check_toolchain.log
	grep '/usr/lib.*/crti.*succeeded' check_toolchain.log
	grep '/usr/lib.*/crtn.*succeeded' check_toolchain.log
	@echo Checking for the correct header path
	grep '^ /usr/include' check_toolchain.log
	grep '^ /usr/include' check_toolchain.log -B1 | \
		head -n 1 | grep '#include <...> search starts here:'
	@echo Checking for the correct library search path
	grep 'SEARCH.*/usr/lib' check_toolchain.log | \
		tr -s '[:space:]' '\n' | grep -v linux-musl
	@# Check for /usr/lib in the search path
	grep 'SEARCH.*/usr/lib' check_toolchain.log | \
		tr -s '[:space:]' '\n' | grep -v linux-musl | \
		grep '^SEARCH_DIR("/usr/lib");$$'
	@# Check for /lib in the search path
	grep 'SEARCH.*/usr/lib' check_toolchain.log | \
		tr -s '[:space:]' '\n' | grep -v linux-musl | \
		grep '^SEARCH_DIR("/lib");$$'
	@# Check that these are the only two results
	test $$(grep 'SEARCH.*/usr/lib' check_toolchain.log | \
		tr -s '[:space:]' '\n' | grep -v linux-musl | wc -l) -eq 2
	@echo Checking that the correct C library is being linked
	grep "/lib.*/libc.so succeeded" check_toolchain.log | \
		grep -v "$(PREFIX)"
	@echo Checking that GCC is finding the correct dynamic linker
	grep 'dynamic-linker /lib/ld-musl-' check_toolchain.log
	touch $@

.PHONY: clean
clean:
	rm -rf check_toolchain.log
	rm -rf .stamp_
	rm -rf a.out
	make -C temporary-libstdcxx clean
	make -C temporary-gcc clean

.stamp-temporary-%:
	make -C temporary-$* OS_PKG_TAG=bs install
	touch $@

.stamp-remove-temporary-%:
	make -C temporary-$* OS_PKG_TAG=bs uninstall
	touch $@

%:
	make -C "$(OS_SRC_DIR)" OS_PKG_TAG=bs install-$*

