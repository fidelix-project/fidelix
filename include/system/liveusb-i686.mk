# Live USB i686 System Configuration
#
# This system configuration should be used for creating bootable
# live USB/SD card images.

# The packages in the boot group to build for this system
BOOT_PACKAGES=linux-generic linux-firmware grub boot-scripts fstab  
# The bootloader to install
BOOT_LOADER=grub-liveusb

