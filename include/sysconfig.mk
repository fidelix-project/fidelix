# Main Source Configuration File

ifndef _INC_SYSCONFIG
_INC_SYSCONFIG=y

# General system configuration
OS_NAME:=Fidelix
OS_NAME_LOWERCASE:=fidelix
OS_DESCRIPTION:=Fidelix Linux
OS_MAJOR:=0
OS_MINOR:=1
OS_VERSION:=$(OS_MAJOR).$(OS_MINOR)
OS_RELEASE_NAME:=Arthur
OS_SRC_DIR:=/usr/src

# Package file configuration
OS_PKG_TAG:=arthur
PKG_EXTENSION:=tgz

# Set the system architecture
OS_ARCH:=x86_64
OS_TARGET_TRIPLET:=$(OS_ARCH)-$(OS_NAME_LOWERCASE)-linux-musl

# Set the system type
OS_SYSTEM:=generic-$(OS_ARCH)

-include config.local.mk
include arch/$(OS_ARCH).mk
include system/$(OS_SYSTEM).mk
endif

