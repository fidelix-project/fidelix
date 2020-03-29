Fidelix /usr/src README
================================================================================

This directory contains a series of Makefiles that can be used for building,
installing, and maintaining the Fidelix system software. It functions very
similarly to the BSD /usr/src and /usr/ports heirarchies.

Fidelix is a light weight Linux distribution that focuses on proactive
security. It aims to eliminate unnecessary code and is target primarily towards
servers and embedded systems.

More information about Fidelix can be found in `doc/about.md`.

# Single Package Targets

## Installing a package

Building and installing a package is as simple as running a single `make`
command. The following will download, verify, build, and install the musl
package and all of its dependencies:

    cd /usr/src
    make install-musl

To force the reinstallation of a package that is already build, use the
`reinstall-package` target.

## Building a package

To build a package without installing it, use the `build-package` target
instead of the `install-package` target, like so:

    cd /usr/src
    make build-musl

Note that running this will also build and install any dependencies of the
musl package.

## Preparing a package for offline building

To prepare a package to be built offline, use the `verify-package` target. This
will download all of the necessary sources and verify their integrity. Later
invocations of `make` for the build and install targets will skip redownloading
and reverifying the sources.

Alternatively, the `download-package` target can be used to only download the
package sources without verifying their integrity. In this case, the integrity
will be verified when the build or install targets are invoked.

## Cleaning the source directory

To completely remove all the sources for a package and the binary package
(forcing a rebuild of the package next time it is installed), use the
`clean-package` target.

To remove all of the source files, build files, and stamps but leave the
binary package, use the `tidy-package` target. This is useful for saving
disk space.

To remove only the build files and leave everything else, use the
`neat-package` target.

To remove the build files and the binary package but leave all the source
files, use the `scrub-package` target. This is useful for forcing the
rebuilding of a package without having to redownload all its sources.

## Building directly from the package directory

It is also possibly to build a package directly from its source directory by
cding there first. In this case, it is no longer necessary to specify the
package name in the target. For example, the commands to install musl would
become:

    cd /usr/src/base/musl
    make install

The same convention holds for the other targets (`download-package`,
`clean-package`, etc).

# Using Package Groups

It is also possible to specify a package group as a target. For example, to
build the entire base system, you can issue either of the following commands:

    cd /usr/src
    make install-base

or

    cd /usr/src/base
    make install

## Recursion

Package groups can also be target recursively. For example, the following
command would recursively build every package in /usr/src:

    cd /usr/src
    make install

# Useful Make Commands

## Preparing to Build the System Offline

    cd /usr/src
    make verify

## Building and Installing the System

    cd /usr/src
    make install

# Rebuilding the System

Note that this will redownload everything and rebuild *every* package on the
system. If you wish to skip redownloading all the package sources, use
`make scrub` instead of `make clean`.

    cd /usr/src
    make clean
    make install

# Notes

## Parallelism

When invoking `make` from the /usr/src heirarchy, you should **never** pass the
`-j` flag to `make`; this is known to cause build failures and exhaust system
resources. Parallel builds can be enabled, disabled, and adjusted by editing
`/usr/src/include/buildconfig.mk`.

## Make Include Directory

In order for the buildsystem to work, the `./include` directory **must** be in
Make's include path. This can be done by adding `-I /usr/src/include` to all
your `make` commands or by creating an alias for `make`:

    alias make=make -I /usr/src/include

