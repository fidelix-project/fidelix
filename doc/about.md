About Fidelix
=============

Fidelix is a light weight Linux distribution that focuses on proactive         
security. It aims to eliminate unnecessary code and is targeted primarily       
towards servers and embedded systems.

# Features

## Functionality Features

Includes these packages in the standard installation (this list is not
exhaustive):

* The Linux Kernel
* musl C Library
* GNU Binutils
* GCC
* GNU Make
* BusyBox (which provides the bulk of the userspace)
* Mandoc
* Perl
* Miscellaneous System Scripts

At least a minimal set of daemons will be included in the base system in the
future.

Eventually, the plan is to support [pkgsrc](https://www.pkgsrc.org/) from
NetBSD. This will (hopefully) provide over 22 000 packages in addition to the
base system for users who require or would like additional functionality.

## Security Features

* Uses [bcrypt](https://en.wikipedia.org/wiki/Bcrypt) for /etc/shadow by
  default.
* No SUID or SGID executables in the default installation; binaries that need
  additional privileges use capabilities instead.
* /proc mounted with hidepid=2: Other users' processes are hidden for all users
  except root.
* Uses [LibreSSL](https://www.libressl.org/).

# History

After working on [Cucumber Linux](https://cucumberlinux.com/) for over three
years, I began to realize that the distribution had grown too large and
convoluted for such a small development team keep up with. I decided that if I
had a chance to do it all over, I would place less emphasis on desktop usage
and more emphasis on server/embedded usage. Additionally, I would greatly
reduce the code base of the base system and opt for lighter weight packages
where possible to further reduce the codebase and decrease the maintainence
burden. By a [work of fate](https://www.cdc.gov/coronavirus/2019-ncov/), I
ended up with a large amount of free time in March and April of 2020 and I
decided to give these ideas a try.

