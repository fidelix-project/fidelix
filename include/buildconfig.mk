# Build environment configuration

# The maximum number of make jobs to run in parallel when building a package.
MAKE_MAXJOBS?=20

# The maximum system load for make. If the system load is above this, make will
# wait for it to drop below this before starting any new jobs.
MAKE_MAXLOAD?=3.5

MAKE_FLAGS=-j $(MAKE_MAXJOBS) -l $(MAKE_MAXLOAD)

# The default action to take when installing new files on package upgrades.
# Note that this affects only installpkg/upgradepkg; it has no bearing on how
# the packages are created.
NEW_FILE_ACTION?=
export NEW_FILE_ACTION

