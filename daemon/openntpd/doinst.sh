#!/bin/sh

# Add the _ntpd user if it does not exist
[ -z "$(grep '^_ntpd:' etc/passwd)" ] && \
	echo '_ntpd:x:123:123:OpenSSH Privsep User:/var/empty:/bin/false' \
	>> etc/passwd

# Add the _ntpd group if it does not exist
[ -z "$(grep '^_ntpd:' etc/group)" ] && \
	echo '_ntpd:x:123:' >> etc/group

# Install new config files
pkgtool install-new-file etc/ntpd.conf

