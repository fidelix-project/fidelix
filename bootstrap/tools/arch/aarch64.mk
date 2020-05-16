# x86_64 Architecture Specific Settings

# The number of bits in a native word.
ARCH_BITS=64

# The name of the architecture as it is in ld-musl-*.so
ARCH_LD_ARCH=aarch64

# The headers to adjust when building GCC (See
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/gcc-pass1.html and
# https://gitlab.com/gusco/pilfs-scripts/-/blob/aarch64/ch5-build.sh)
ARCH_GCC_HEADERS=\
	gcc/config/aarch64/aarch64-linux.h \
	gcc/config/alpha/linux-elf.h \
	gcc/config/alpha/linux.h \
	gcc/config/arc/linux.h \
	gcc/config/arm/linux-eabi.h \
	gcc/config/arm/linux-elf.h \
	gcc/config/bfin/linux.h \
	gcc/config/cris/linux.h \
	gcc/config/frv/linux.h \
	gcc/config/h8300/linux.h \
	gcc/config/i386/linux.h \
	gcc/config/i386/linux64.h \
	gcc/config/i386/sysv4.h \
	gcc/config/ia64/linux.h \
	gcc/config/ia64/sysv4.h \
	gcc/config/linux.h \
	gcc/config/m32r/linux.h \
	gcc/config/m68k/linux.h \
	gcc/config/microblaze/linux.h \
	gcc/config/mips/linux.h \
	gcc/config/mn10300/linux.h \
	gcc/config/nds32/linux.h \
	gcc/config/nios2/linux.h \
	gcc/config/or1k/linux.h \
	gcc/config/riscv/linux.h \
	gcc/config/rs6000/linux.h \
	gcc/config/rs6000/linux64.h \
	gcc/config/rs6000/sysv4.h \
	gcc/config/s390/linux.h \
	gcc/config/sh/linux.h \
	gcc/config/sparc/linux.h \
	gcc/config/sparc/linux64.h \
	gcc/config/sparc/sysv4.h \
	gcc/config/tilegx/linux.h \
	gcc/config/tilepro/linux.h \
	gcc/config/vax/linux.h \
	gcc/config/xtensa/linux.h

