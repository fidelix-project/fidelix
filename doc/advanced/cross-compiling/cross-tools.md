Building a Cross Toolchain
==========================

Overview
--------
This section documents how to build a cross toolchain suitable for use with
Fidelix. The resulting toolchain will use the same versions of the toolchain
packages (binutils, gcc, musl, gmp, mpfr and mpc) as the corresponding version
of Fidelix and will be located within the /opt/cross heirarchy.

Building
--------
Fidelix has support for building cross toolchains in the system source tree; it
supports every architecture supported by Fidelix. The cross compiler build
system resides `/usr/src/util/cross-tools`. Within this directory, a separate
subdirectory exists for each target architecture: each architecture's toolchain
gets built as a separate package.

To build and install cross toolchains for every supported architecture, do the
following:

    cd /usr/src/util/cross-tools 
    make install

You may not have a need build a toolchain for every architecture. In this case,
the following can be done to build and install a toolchain targeting one
specific architecture (in this case i686, adjust this to the desired
architecture):

    cd /usr/src/util/cross-tools/cross-tools-i686 
    make install

Setting up the Toolchain Environment
------------------------------------

### Adjusting the Path
After installation, the toolchain is located within the /opt/cross heirarchy.
Each target architecture for which a toolchain was built has a subdirectory
there. Within that subdirectory, the toolchain binaries are located in the bin
directory. This directory is not included in the `PATH` variable by default and
will need to be explicitly added:

    export PATH=/opt/cross/i686/bin:$PATH

Make sure to adjust the architecture appropriately and repeat for each
architecture you built support for. You may wish to add this to your ~/.ashrc
so this is done automatically every time you log in.

### Providing a Sysroot
The cross toolchain is now capable of targeting a Fidelix installation of its
target architecture; however, it still needs a Fidelix root filesystem
(sysroot) to target. Without a sysroot to target, the toolchain will not have
libraries or even a C runtime to link against, limiting its usefulness and
rendering it unable to compile most applications.

There are two ways to obtain a suitable sysroot: downloading a tarball and
building from source.

#### Downloading a Sysroot Tarball
The easiest way to provide a sysroot for the toolchain to target it to download
one of the Root Filesystem images for the target architecture (available at
https://fidelix.us/download/). Make sure to download an image for the same
version of Fidelix that the cross toolchain was build for. Once downloaded,
create a directory to serve as your sysroot and extract the root filesystem
tarball to there.

The following example creates an i686 sysroot at /var/chroot/i686 for version
0.2.0 of Fidelix.

    cd
    wget https://github.com/fidelix-project/fidelix/releases/download/0.2.0/fidelix-0.2.0-i686-build20b-minirootfs.tar.gz
    wget https://fidelix.us/download/hashes/0.2.0-sha256sums
    shasum -a 256 --ignore-missing -c 0.2.0-sha256sums
    mkdir -p /var/chroot/i686
    cd /var/chroot/i686
    bsdtar xf ~/fidelix-0.2.0-i686-build20b-minirootfs.tar.gz

#### Building a Sysroot from Source
The other, more advanced option is to build a sysroot from source. This is
thoroughly documented in the next section, [Cross Compiling
Fidelix](cross-fidelix.md).

Using the Toolchain
-------------------
Once the previous sections are complete, the cross toolchain will be ready for
use.

To cross compile a C source file for Fidelix i686 (assuming your sysroot is
located at /var/chroot/i686):

    i686-fidelix-linux-musl-gcc --sysroot=/var/chroot/i686 test.c -o test

### Building Third Party Software
When using the cross toolchain to build third party software, it will be
necessary adjust the CC and CFLAGS variables and/or host triplet so that the
package is built using the cross toolchain.

For packages using plain Makefiles, it is usually something like the following:

    make CC=i686-fidelix-linux-musl-gcc CFLAGS="--sysroot=/var/chroot/i686"

For packages using the GNU Autotools, it is usually something like this:

    ./configure --host=i686-fidelix-linux-musl --with-sysroot=/var/chroot/i686

