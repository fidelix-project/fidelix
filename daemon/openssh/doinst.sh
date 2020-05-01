#!/bin/sh

# Add the _sshd user if it does not exist
[ -n "$(grep '^_sshd:' etc/passwd)" ] && \
	echo '_sshd:x:22:22:OpenSSH Privsep User:/var/empty:/bin/false' \
	>> etc/passwd

# Add the _sshd group if it does not exist
[ -n "$(grep '^_sshd:' etc/group)" ] && \
	echo '_sshd:x:22:' >> etc/group

