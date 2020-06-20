# The number of bits in a native word.
ARCH_BITS=64

# The archicture family
ARCH_FAMILY=arm

# The suffix for the architecture's library directory. For many architectures
# this will be the native word size.
ARCH_LIBDIR_SUFFIX=64

# The directory for this architecture in the Linux kernel source
ARCH_KERNEL=aarch64

# The architecture tag that appears in the dynamic linker: /lib/ld-musl-*.so.1
DYNLD_ARCH=aarch64

# The image file formats to build by default
ARCH_IMGFMTS=src pkgs rootfs minirootfs

