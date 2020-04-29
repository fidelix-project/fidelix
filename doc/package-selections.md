Package Selections
==================

In many cases, one may wish to install the system without installing every
default package. One such instance of this is when creating an initrd: it is
desirable to leave out the compiler package since this takes up over 600 MB of
disk space.

To support these cases, Fidelix uses the concept of package selections. A
package selection is simply a list of packages that will be installed. They are
defined in the `include/selection` directory.

Installing a Package Selection
==============================

To install a package selection, first navigate to the root of the source tree
(/usr/src by default). Then use the following Make command, substituting the
name of the package selection as it appears in `include/selection` for
`<name>`:

    make install-selection SELECTION=<name>

Creating a Package Selection
============================

Creating a package selection is a fairly straightforward process:

1. Create a new Makefile in the `include/selection` directory. The name of this
   Makefile should be `<selection_name>.local.mk`.
2. In that file, define the `SELECTED_PACKAGES` make variable to be a
   whitespace separated list of packages to be installed.

Note that any custom package selections should end with `.local.mk`. Makefiles
without `.local.mk` are reserved for use by the distribution developers:
`.local.mk` files in the `include/selection` directory will never be
overwritten by the ditribution's files, but there is no such guarantee for
other Makefiles in that directory. Additionally, and `.local.mk` file will
always take precedence over any distribution provided Makefiles.

Note that in addition to listing individual packages, you can also list a
package series.

Package Selection on the Command Line
-------------------------------------

If you do not wish to make a selection file, it is also possible to define the
selected packages on the command line, like so:

    make install-selection "SELECTED_PACKAGES=musl busybox"

