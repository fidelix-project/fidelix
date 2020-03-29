# Include file for the bootstrap environment

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
ARCH=x86_64

# The ID for the distribution in the host triplet.
DISTID=bootstrap

TARGET=$(ARCH)-$(DISTID)-linux-musl

