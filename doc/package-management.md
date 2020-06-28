Package Management Overview
===========================

Package File Format
-------------------

A Fidelix package file is a compressed tarball containing the package's
contents. The files are stored relative to the root of the filesystem. The
package file is compressed using either gzip or bzip2 and caries an extension
of .tgz or .tbz respectively.

Package files are named acording to the following scheme:
*PACKAGE_NAME*-*VERSION*-*ARCH*-*OS_VERSION*-*BUILD_NUMBER*. For example: busybox-1.3.1-aarch64-build20b-1.

* *PACKAGE_NAME* - the name of the package, such as busybox. May contain the
  following characters: `[a-zA-Z0-9-]`.
* *VERSION* - the version of the package. May contain the following characters:
  `[a-zA-Z0-9.]`.
* *ARCH* - the architecture the package is built for. May contain the following
  characters: `[a-zA-Z0-9_]`.
* *OS_VERSION* - the release name of the version of Fidelix this package is
  built for. May contain the following characters: `[a-z0-9]`.
* *BUILD_NUMBER* - the build number of this package. Each time a package is
  changed/rebuilt, but niether the *VERSION* nor the *OS_VERSION* change, this
  number is incremented to distinguish the build. May contain the following
  characters: `[0-9]`.

Package Tools
-------------

Fidelix uses a series of shell scripts for package management, collectively
referred to as pkgtools. Pkgtools contains the following scripts:

* installpkg - Used for installing new packages.
* upgradepkg - Used for upgradine existing packages.
* removepkg - Used for uninstalling packages.
* makepkg - Used for creating packages.
* insignia - Used for cryptographically signing and verifying packages.
* pkgtool - Provides various utility functionality.

### Usage

Detailed documentation and usage information about each script can be found in
its respective [man page](https://fidelix.us/man/). When using the /usr/src
heirarchy to manage your system, these scripts will be called automatically as
needed.

