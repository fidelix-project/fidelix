Glossary of Terms
=================

**Buildsystem**: The build system that a package uses for compilation, such as
`make` for `make && make install` or `autoconf` for
`./configure && make && make install`.

**Package Group**: A logical grouping of package by function, such as base or
boot.

**Package Selection**: A list of packages to install when using
`make install-selection`. Set by the `SELECTION` variable.

**System Target**: The physical system type that you are installing to, such as
`chroot` for a chroot environment or `live-usb-x86_64` for a live USB flash
drive. Set by the `SYSTEM` variable.

