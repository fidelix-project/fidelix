#!/bin/sh

# Add the _sshd user if it does not exist
[ -z "$(grep '^_sshd:' etc/passwd)" ] && \
	echo '_sshd:x:22:22:OpenSSH Privsep User:/var/empty:/bin/false' \
	>> etc/passwd

# Add the _sshd group if it does not exist
[ -z "$(grep '^_sshd:' etc/group)" ] && \
	echo '_sshd:x:22:' >> etc/group

# Setcap the key signing binary
setcap CAP_DAC_READ_SEARCH=ep usr/libexec/ssh-keysign

# Install new config files
pkgtool install-new-file etc/ssh/ssh_config
pkgtool install-new-file etc/ssh/sshd_config

