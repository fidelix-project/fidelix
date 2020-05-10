#!/bin/sh

# The following users and groups are not provided by the base system need to be
# present in order for certain packages to build. This script adds them all in
# one fell swoop.

# For /net/avahi
addgroup -g 200 -S avahi
adduser -u 200 -S -H -h /dev/null -s /bin/false -G avahi avahi

# For /security/polkit
addgroup -g 201 -S polkitd
adduser -u 201 -S -H -h /var -s /bin/false -G polkitd polkitd
