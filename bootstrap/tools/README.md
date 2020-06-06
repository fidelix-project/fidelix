Bootstrap README
================================================================================

# Building the Bootstrap Tools

## Prereqs

### Disk Space Requirements

Building the bootstrap requires you to have at fairly large amount of free disk
space. These are the specific requirements: 

* At least 12 GB of free disk space on the partition the bootstrap buildsystem
  is located on (that's the directory of this file).
* About 1.2 GB of free space on the partition that `PREFIX` resides on (by
  default this is `/opt/bootstrap`)
* 20+ GB of free space on the partition you are bootstrapping to (the `CHROOT`
  directory). The exact requirement varies depending on which packages you are
  building. By default, this is `/mnt`.

### Required Packages

To build the bootstrap, you should have a reasonably new version of these
packages installed on your host system:

* binutils
* glibc or musl (other C libraries may work but have not been tested).
* gcc
* g++ (if not included in your distribution's gcc package)
* libstdcxx (if not included in your distribution's gcc package)
* m4
* GNU make
* texinfo
* bison
* flex
* autoconf
* automake
* autoconf-archive
* perl
* pkg-config or pkgconf
* gettext
* help2man
* patch

Some distributions (such as Debian and RedHat) place the runtime versions of
these programs in different packages than the development versions. If you
experience issues building related to missing programs, make sure you have both
the runtime and development versions of the packages installed.

If you are building on a recent Debian derived distribution, ensure /bin/sh
points to some shell with a GNU/BSD/BusyBox compliant echo; the default of
/bin/dash does not. Changing it to point to /bin/bash is known to work.

## Building

Once you have the prereqs installed, build the bootstrap tools by issuing the
following Make command:

    make

**Note:** do **not** enable parallel builds with make via the `-j` flag; this
is know to break things. To build in parallel, adjust the `MAXJOBS` variable in
the makefile.

Assuming the `make` command runs to completion successfully, you will be left
with a `bootstrap.tar` file containing your bootstrap tools.

# Entering the Chroot

The Makefile assumes that the partition/directory you want to chroot to is
mounted at /mnt. This can be overridden by setting the `CHROOT` enviornment
variable.

## Download the Package Sources

It is recommended to download the source code for the system packages now.
Downloading the source code does not work in the bootstrap environment without
additional setup. Use the following command:

    make -C ossrc -I ossrc/include download

## Setup

The source for the target system must be placed in the `ossrc` directory. Note
that this can also be a symlink to the source directory. By default, this is a
symlink to the parent of the Fidelix source tree (../../). If you wish to
bootstrap to a different version of Fidelix, place the source code for that
version in the `ossrc` directory.

Once you have done this, prepare the chroot environment by issuing the
following Make command:

    make prepare-chroot

**Note:** If you leave the default `ossrc` symlink in place, you may want to
run `make tidy` before running `make prepare-chroot`. This will save you from
copying over 10 GB of unnecessary files.

## Entering

Once you have completed the necessary setup, enter the chroot with the
following command (on most systems this will need to be done as root):

    make chroot

If at any point you need to reenter the chroot environment, you can do so by
reissuing that Make command.

# Bootstrapping Once in the Chroot

The system source code will already be set up in /usr/src. Bootstrapping the
rest of the system should be as simple as the following:

    cd /usr/src
    make -I /usr/src/include from-bootstrap && \
    make -I /usr/src/include install

Note that it is possible to use other Make targets for system installation. For
example, use `make install-base` to build and install only the base system.

