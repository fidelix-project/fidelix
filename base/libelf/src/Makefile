# $FreeBSD$

CC?=cc
INSTALL?=install
LNS?=ln -sf

CFLAGS?=	-O2 -fpic -DPIC -g
CFLAGS+=	-Iinclude
CFLAGS+=	--std=gnu99

OS=$(shell uname)

ifeq "$(OS)" "Linux"
include os.Linux.mk
endif

GENHDR=native-elf-format.h
SOFILE=libelf.so.2

OBJS=	elf							\
	elf_begin						\
	elf_cntl						\
	elf_end elf_errmsg elf_errno			\
	elf_data						\
	elf_fill						\
	elf_flag						\
	elf_getarhdr						\
	elf_getarsym						\
	elf_getbase						\
	elf_getident						\
	elf_hash						\
	elf_kind						\
	elf_memory						\
	elf_next						\
	elf_open						\
	elf_rand						\
	elf_rawfile						\
	elf_phnum						\
	elf_shnum						\
	elf_shstrndx						\
	elf_scn						\
	elf_strptr						\
	elf_update						\
	elf_version						\
	gelf_cap						\
	gelf_checksum						\
	gelf_dyn						\
	gelf_ehdr						\
	gelf_getclass						\
	gelf_fsize						\
	gelf_mips64el						\
	gelf_move						\
	gelf_phdr						\
	gelf_rel						\
	gelf_rela						\
	gelf_shdr						\
	gelf_sym						\
	gelf_syminfo						\
	gelf_symshndx						\
	gelf_xlate						\
	libelf_align						\
	libelf_allocate					\
	libelf_ar						\
	libelf_ar_util					\
	libelf_checksum					\
	libelf_data						\
	libelf_ehdr						\
	libelf_elfmachine					\
	libelf_extended					\
	libelf_memory						\
	libelf_open						\
	libelf_phdr						\
	libelf_shdr						\
	libelf_xlate						\
	$(GENSRC)

GENSRC=libelf_fsize libelf_msize libelf_convert

$(SOFILE): $(addsuffix .pico,$(OBJS))
	$(CC) $(LDFLAGS) -shared \
		-Wl,--version-script=Version.map -Wl,-x -Wl,-soname,$@ \
		-o $@ $^

.PHONY: clean
clean:
	rm -f $(addsuffix .c,$(GENSRC))
	rm -f $(GENHDR)
	rm -f $(addsuffix .pico,$(OBJS))
	rm -f $(SOFILE)

native-elf-format.h: util/native-elf-format
	$< > $@

$(addsuffix .pico,$(GENSRC)): $(addsuffix .c,$(GENSRC))

%.pico: %.c $(GENHDR)
	$(CC) $(CFLAGS) -c $< -o $@

SRCDIR=	.
INCS=	libelf.h gelf.h
PREFIX?=/usr
DESTDIR?=
LIBDIR?=$(DESTDIR)$(PREFIX)/lib
INCDIR?=$(DESTDIR)$(PREFIX)/include
MANDIR?=$(DESTDIR)$(PREFIX)/share/man

.PHONY: install install-lib install-header install-man
install: install-lib install-header install-man
	
install-lib: $(SOFILE)
	$(INSTALL) -dm 755 $(LIBDIR)
	$(INSTALL) -m 755 $(SOFILE) $(LIBDIR)/
	$(LNS) $(SOFILE) $(LIBDIR)/libelf.so

install-header:
	$(INSTALL) -dm 755 $(INCDIR)
	$(INSTALL) -m 644 include/libelf.h $(INCDIR)/
	$(INSTALL) -m 644 include/gelf.h $(INCDIR)/
	$(INSTALL) -dm 755 $(INCDIR)/sys
	$(INSTALL) -m 644 include/sys/elf_common.h $(INCDIR)/sys/
	$(INSTALL) -m 644 include/sys/elf32.h $(INCDIR)/sys/
	$(INSTALL) -m 644 include/sys/elf64.h $(INCDIR)/sys/

MAN=	elf.3							\
	elf_begin.3						\
	elf_cntl.3						\
	elf_end.3						\
	elf_errmsg.3						\
	elf_fill.3						\
	elf_flagdata.3						\
	elf_getarhdr.3						\
	elf_getarsym.3						\
	elf_getbase.3						\
	elf_getdata.3						\
	elf_getident.3						\
	elf_getscn.3						\
	elf_getphdrnum.3					\
	elf_getphnum.3						\
	elf_getshdrnum.3					\
	elf_getshnum.3						\
	elf_getshdrstrndx.3					\
	elf_getshstrndx.3					\
	elf_hash.3						\
	elf_kind.3						\
	elf_memory.3						\
	elf_next.3						\
	elf_open.3						\
	elf_rawfile.3						\
	elf_rand.3						\
	elf_strptr.3						\
	elf_update.3						\
	elf_version.3						\
	gelf.3							\
	gelf_checksum.3						\
	gelf_fsize.3						\
	gelf_getcap.3						\
	gelf_getclass.3						\
	gelf_getdyn.3						\
	gelf_getehdr.3						\
	gelf_getmove.3						\
	gelf_getphdr.3						\
	gelf_getrel.3						\
	gelf_getrela.3						\
	gelf_getshdr.3						\
	gelf_getsym.3						\
	gelf_getsyminfo.3					\
	gelf_getsymshndx.3					\
	gelf_newehdr.3						\
	gelf_newphdr.3						\
	gelf_update_ehdr.3					\
	gelf_xlatetof.3

MLINKS+= \
	elf_errmsg.3 elf_errno.3		\
	elf_flagdata.3 elf_flagarhdr.3		\
	elf_flagdata.3 elf_flagehdr.3		\
	elf_flagdata.3 elf_flagelf.3		\
	elf_flagdata.3 elf_flagphdr.3		\
	elf_flagdata.3 elf_flagscn.3		\
	elf_flagdata.3 elf_flagshdr.3		\
	elf_getdata.3 elf_newdata.3		\
	elf_getdata.3 elf_rawdata.3		\
	elf_getscn.3 elf_ndxscn.3		\
	elf_getscn.3 elf_newscn.3		\
	elf_getscn.3 elf_nextscn.3		\
	elf_getshstrndx.3 elf_setshstrndx.3	\
	elf_open.3 elf_openmemory.3             \
	gelf_getcap.3 gelf_update_cap.3		\
	gelf_getdyn.3 gelf_update_dyn.3		\
	gelf_getmove.3 gelf_update_move.3	\
	gelf_getrel.3 gelf_update_rel.3		\
	gelf_getrela.3 gelf_update_rela.3	\
	gelf_getsym.3 gelf_update_sym.3		\
	gelf_getsyminfo.3 gelf_update_syminfo.3	\
	gelf_getsymshndx.3 gelf_update_symshndx.3 \
	gelf_update_ehdr.3 gelf_update_phdr.3	\
	gelf_update_ehdr.3 gelf_update_shdr.3	\
	gelf_xlatetof.3 gelf_xlatetom.3

#.for E in 32 64
MLINKS+= \
	gelf_checksum.3	elf${E}_checksum.3 	\
	gelf_fsize.3	elf${E}_fsize.3 	\
	gelf_getehdr.3	elf${E}_getehdr.3	\
	gelf_getphdr.3	elf${E}_getphdr.3	\
	gelf_getshdr.3	elf${E}_getshdr.3	\
	gelf_newehdr.3	elf${E}_newehdr.3	\
	gelf_newphdr.3	elf${E}_newphdr.3	\
	gelf_xlatetof.3	elf${E}_xlatetof.3	\
	gelf_xlatetof.3	elf${E}_xlatetom.3
#.endfor

install-man: $(addprefix install-manpage-,$(MAN))

$(MANDIR)/man3:
	$(INSTALL) -dm 755 $@

.PHONY: install-manpage-%
install-manpage-%.3: %.3 $(MANDIR)/man3 
	$(INSTALL) -m 644 $< $(MANDIR)/man3/

VERSION_MAP=           ${SRCDIR}/Version.map

libelf_convert.c:	elf_types.m4 libelf_convert.m4
libelf_fsize.c:		elf_types.m4 libelf_fsize.m4
libelf_msize.c:		elf_types.m4 libelf_msize.m4

.SUFFIXES:	.m4 .c
.m4.c:
	m4 -D SRCDIR=${SRCDIR} ${M4FLAGS} $< > $@

