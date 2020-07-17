Third Party Packages
====================

The Fidelix base system is intentionally small and lightweight. That
withstanding, we do realize that may users may want or need additional packages
that are not provided by the base system. To meet these users' needs, Fidelix
supports NetBSD's [pkgsrc](http://pkgsrc.org) framework for building and
installing third party packages.

# Getting Started

To get started with pkgsrc on Fidelix, navigate to the `/usr/src/util/pkgsrc`
directory. To perform the initial bootstrap and installtion, run `make install`
from this directory. Once pkgsrc has been bootstrapped, the pkgsrc sources will
be in `/usr/pkgsrc` and pkgsrc provided packages will reside in `/usr/pkg`.

Note that you should not install or bootstrap pkgsrc through other means on
Fidelix. The provided Makefile sets certain variables, configures certain
files, and applies certain patches without which pkgsrc will not work properly
on Fidelix.

# Building Packages from Source

To build a pkgsrc package from source, navigate over to the appropriate package directory under `/usr/pkgsrc`. Then run `bmake install`. Note that you **must**
use `bmake` instead of `make` when building pkgsrc provided packages.

# Installing Prebuilt Binary Packages

This capability will be forthcoming in the future for select packages on select
architectures. In the meantime, it will be necessary to build third party
packages from source.

# Additional Documentation

The full pkgsrc documentation can be found at
[http://pkgsrc.org/#docs](http://pkgsrc.org/#docs).

# Notes

## Updating pkgsrc

To update pkgsrc, run `make update` from within the `/usr/src/util/pkgsrc`
directory.

## Precedence of Programs

On Fidelix, the `PATH` variable is set such that the following directory
precendence is used when running binaries (from highest precendence to lowest):

1. /usr/local/bin
2. /usr/bin
3. /bin
4. /usr/pkg/bin

Consequentially binary programs in the base system will take precendence over
binary programs provided by pkgsrc by default. If you wish for a program from
pkgsrc to take priority, it is recommended to adheer to the following
guidelines.

First, do **not** change the `PATH` variable to give /usr/pkg/bin higher
priority. This will cause *every* program provided by pkgsrc to take priority
over the base system, which is problematic for a couple of reasons: one, this
can break the base system under certain circumstances; two, packages provided
by pkgsrc do not receive the same level of attention and maintainance that the
base system does.

Instead, it is recommended to symlink the binary you want to take precedence
into `/usr/local/bin`. This way a pkgsrc provided binary will not take
precedence without the system administrator's knowledge.

## Additional Hints

There are additional hints for using pkgsrc on Fidelix at
[/usr/src/util/pkgsrc/HINTS.md](../.../usr/src/util/pkgsrc/HINTS.md).

