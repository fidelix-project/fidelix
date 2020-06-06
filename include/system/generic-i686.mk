# Generic i686 System Configuration
#
# This system configuration should be sufficient for most modern Intel/AMD
# based systems.

# The packages in the boot group to build for this system
BOOT_PACKAGES=linux-generic linux-firmware grub boot-scripts fstab  
# The bootloader to install
BOOT_LOADER=grub-pc

