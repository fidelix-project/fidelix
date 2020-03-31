#!/bin/sh

if [ ! -e etc/passwd ]; then
	cat > etc/passwd <<- EOF
	root::0:0:root:/root:/bin/sh
	bin:x:1:1:bin:/dev/null:/bin/false
	daemon:x:6:6:Daemon User:/dev/null:/bin/false
	messagebus:x:18:18:D-Bus Message Daemon User:/var/run/dbus:/bin/false
	nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
	EOF
	chmod 644 etc/passwd
	chown 0:0 etc/passwd
fi

if [ ! -e etc/group ]; then
	cat > etc/group <<- EOF
	root:x:0:
	bin:x:1:
	sys:x:2:
	kmem:x:3:
	tty:x:4:
	tape:x:5:
	daemon:x:6:
	floppy:x:7:
	disk:x:8:
	lp:x:9:
	dialout:x:10:
	audio:x:11:
	video:x:12:
	utmp:x:13:
	usb:x:14:
	cdrom:x:15:
	shadow:x:16:
	EOF
	chmod 644 etc/group
	chown 0:0 etc/group
fi

if [ ! -e etc/shadow ]; then
	cat > etc/shadow <<- EOF
	root::::::::
	bin:*:::::::
	daemon:*:::::::
	messagebus:*:::::::
	nobody:*:::::::
	EOF
	chmod 640 etc/shadow
	chown root:shadow etc/shadow
fi

ln -svf /proc/self/mounts etc/mtab

touch var/log/btmp
touch var/log/lastlog
touch var/log/faillog
touch var/log/wtmp
chgrp -v utmp var/log/lastlog
chmod -v 664 var/log/lastlog
chmod -v 600 var/log/btmp

