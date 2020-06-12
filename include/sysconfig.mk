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
OS_SRC_DIR?=/usr/src

# Patch and prerelease versioning
OS_PATCH:=2
OS_PRERELEASE:=

# Package file configuration
OS_PKG_TAG:=arthur
PKG_EXTENSION:=tgz

# Set the system architecture
OS_ARCH?=$(shell arch)
OS_TARGET_TRIPLET:=$(OS_ARCH)-$(OS_NAME_LOWERCASE)-linux-musl

# Set the system type
SYSTEM?=generic-$(OS_ARCH)
OS_SYSTEM:=$(SYSTEM)
SYSROOT?=/

-include config.local.mk

ifdef OS_PRERELEASE
OS_FULL_VERSION:=$(OS_MAJOR).$(OS_MINOR).$(OS_PATCH)-$(OS_PRERELEASE)
else
OS_FULL_VERSION:=$(OS_MAJOR).$(OS_MINOR).$(OS_PATCH)
endif

include arch/$(OS_ARCH).mk
include system/$(OS_SYSTEM).mk
endif

