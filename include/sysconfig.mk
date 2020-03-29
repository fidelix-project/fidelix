# Main Source Configuration File

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
include arch/$(OS_ARCH).mk
OS_TARGET_TRIPLET:=$(OS_ARCH)-$(OS_NAME_LOWERCASE)-linux-musl

