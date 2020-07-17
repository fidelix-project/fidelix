Installing and Removing Additional Packages
===========================================

This document covers installing and removing additional packages in the base
system. It does not document working with third party packages. Documentation
on the latter can be found in the [Third Party
Packages](third-party-packaged.md) section.

Installing New Packages
-----------------------

There are two ways to install to install base system packages: by downloading
the prebuilt binary package and by building the package from source. Both are
documented below. Be forewarned that compiling packages from source can take a
long time, especially on low power systems.

### Installing from Binary Packages

Support for this will be coming soon. In the meantime, it will be necessary to
install the packages from source.

### Installing from Source

Installing packages from source first requires the source tree to be present at
/usr/src. If you did not install [do so before
proceeding](../install.md#installing-the-system-source-code).

It is good practice to [update your system](updating.md) before installing new
packages.

Now, navigate to the /usr/src directory. The `make` command is used to build
packages. The target you should make is `install-PACKAGE_NAME`, where
*PACKAGE_NAME* is the name of the package you wish to install. For example, the
following command installs the bsdtar package:

    cd /usr/src
    make install-bsdtar

This will first recursively build and install any dependencies for bsdtar and
then build and install bsdtar itself.

Removing Packages
-----------------

[Pkgtools](overview.md#package-tools) keeps a database of installed packages at
`/var/pkgdb`. In this directory, there is a subdirectory for each installed
package. To uninstall a package, use the `removepkg` command, specifying the
package name **exactly** as it appears in `/var/pkgdb`.

For example, assume a portion of the output from `ls /var/pkgdb` is as follows:

    ...
    boot-scripts-0.2-x86_64-build20b-1
    bsdtar-3.4.3-x86_64-build20b-1
    busybox-1.31.1-x86_64-build20b-3
    ...

To uninstall the bsdtar package, issue the following command:

    removepkg bsdtar-3.4.3-x86_64-build20b-1

