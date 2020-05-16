# x86_64 Architecture Specific Settings

# The number of bits in a native word.
ARCH_BITS=64

# The name of the architecture as it is in ld-musl-*.so
ARCH_LD_ARCH=x86_64

# The headers to adjust when building GCC (See
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/gcc-pass1.html)
ARCH_GCC_HEADERS=\
	gcc/config/i386/linux.h \
	gcc/config/i386/linux64.h

