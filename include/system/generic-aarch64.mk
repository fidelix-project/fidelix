# Generic aarch64 System Configuration
#
# This system configuration provides a userspace for aarch64. It does not
# provide a bootloader or a kernel as the requirements for these vary
# drastically system to system with ARM.

# The packages in the boot group to build for this system
BOOT_PACKAGES=boot-scripts fstab  
# The bootloader to install
BOOT_LOADER=

