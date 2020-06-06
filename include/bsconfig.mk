# Include file for the bootstrap environment

ifndef _INC_BSCONFIG
_INC_BSCONFIG=y

# The prefix to place the bootstrap environment in.
PREFIX=/opt/bootstrap

# The name of the tar archive to save the bootstrap in.
OUTPUT_FILE=bootstrap.tar

# Whether or not to run the test suites. Set to true to run them, or false to
# skip them.
RUN_TESTS=true

# The maximum number of make jobs to run in parallel.
MAXJOBS=3

# The architecture to target. Note that the host system **must** be able to run
# binaries produced for this architecture.
ARCH?=$(shell arch)

# The ID for the distribution in the host triplet.
DISTID=bootstrap

# The version of GCC to used in the bootstrap tools.
BS_GCC_VERSION=9.2.0

TARGET=$(ARCH)-$(DISTID)-linux-musl

-include config.local.mk
endif

