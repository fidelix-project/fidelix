# Toolchain Configuration File

ifndef _INC_TOOLCHAIN
_INC_TOOLCHAIN=y

# Export the PATH in case any tools are located outside the default path.
#export PATH

include sysconfig.mk

CROSS_HOST_TRIPLET:=$(OS_TARGET_TRIPLET)
HOST_CC=	cc
HOST_CPP=	cpp
HOST_CXX=	c++
HOST_LD=	ld
HOST_AR=	ar
HOST_AS=	as
HOST_RANLIB=	ranlib
HOST_STRIP=	strip
HOST_ZIC=	zic

CROSS_TARGET_TRIPLET=$(OS_CROSS_TRIPLET)
# If we are not cross compiling, the target tools are the host tools
ifeq ($(CROSS_HOST_TRIPLET), $(CROSS_TARGET_TRIPLET))
TARGET_CC=	$(HOST_CC)
TARGET_CPP=	$(HOST_CPP)
TARGET_CXX=	$(HOST_CXX)
TARGET_LD=	$(HOST_LD)
TARGET_AR=	$(HOST_AR)
TARGET_AS=	$(HOST_AS)
TARGET_RANLIB=	$(HOST_RANLIB)
TARGET_STRIP=	$(HOST_STRIP)

# If we are cross compiling, adjust the target toolcahin variables to use the
# CROSS_TARGET_TRIPLET.
else
TARGET_CC=	$(CROSS_TARGET_TRIPLET)-gcc
TARGET_CPP=	$(CROSS_TARGET_TRIPLET)-cpp
TARGET_CXX=	$(CROSS_TARGET_TRIPLET)-g++
TARGET_LD=	$(CROSS_TARGET_TRIPLET)-ld
TARGET_AR=	$(CROSS_TARGET_TRIPLET)-ar
TARGET_AS=	$(CROSS_TARGET_TRIPLET)-as
TARGET_RANLIB=	$(CROSS_TARGET_TRIPLET)-ranlib
TARGET_STRIP=	$(CROSS_TARGET_TRIPLET)-strip
endif

# The variable CROSS_COMIPLE can be used to determine if we are cross
# compiling.
ifneq ($(CROSS_HOST_TRIPLET),$(CROSS_TARGET_TRIPLET))
CROSS_COMPILE=	y
endif

CFLAGS+=	-O2
CXXFLAGS+=	-O2
export CFLAGS CXXFLAGS LDFLAGS

# If we are installing to a differenc SYSROOT
ifneq ($(SYSROOT), /)
ALT_ROOT:=	y
CFLAGS+=	--sysroot=$(SYSROOT)
CXXFLAGS+=	--sysroot=$(SYSROOT)
LDFLAGS+=	--sysroot=$(SYSROOT)
endif

endif

