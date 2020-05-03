Updating Fidelix
================

It is generally desirable to apply system updates. Fidelix provides a few ways
to do this.

# Updating from Source

## Using Tarballs

This is currently the most straightforward way to update your system. Start by
downloading the tarball for the release or branch you want to upgrade to from
GitHub. For example, to upgrade to the latest development version, use
something like:

    wget https://github.com/Z5T1/fidelix/archive/master.tar.gz

Next extract the tarball. This will create the directory `fidelix-master`. The
name varies depending on which release or branch you are upgrading to.

Then head over to `/usr/src` and run the following command, replacing
`~/fidelix-master` with the directory that was created when you extracted the
tarball. This will update the contents of your /usr/src directory.

    make OS_SRC_DIR=~/fidelix-master copy-src

Finally, from `/usr/src`, run:

    make SELECTION=installed-packages install-selection

This will build any updated packages from source as necessary and upgrade them,
provided that some version of the package is already installed (it will not
install new packages). To install new packages in addition to any updates, use
the following command instead:

    make install

## Using Patches

Go to https://github.com/Z5T1/fidelix/compare/. Select a base and compare
branch/tag. Add a `.patch` suffix to the end of the resultant URL. Download
this patch file.

For example, to upgrade from snapshot20200429a to the latest version of the
system, use the following wget command:

    wget https://github.com/Z5T1/fidelix/compare/snapshot20200429a...master.patch

Once you have the patch, go over to `/usr/src`. Apply the patch with the
following patch command, substituting in the path to the patch you downloaded:

    patch -p1 < ~/snapshot20200429a...master.patch

Now run the following command to update all the installed packages:

    make SELECTION=installed-packages install-selection

As for the previous case, this will build packages from source as necessary. To
install new packages as well, use:

    make install

# Updating from Binaries

Support for this will be forthcoming in the future.

# Notes

## Updateing a New Installation

When updating a new installation, it is a good idea to set the
`NEW_FILE_ACTION` variable to either `REPLACE` or `OVERWRITE`. This ensures
that any new configuration files replace the old ones. Generally, this is not
desirable since this removes any customizations; however, since the system is
brand new and has not had extensive configuration yet, in this case it makes
sense to use the new config files, which may possible have bug/security fixes.

