Fidelix Groups
==============

The following groups are used by packages in the base system. By convention,
groups that are used by a particular service start with an underscore.

| Group		| GID	| Description				| Package	|
| ------------- | ----- | ------------------------------------- | ------------- |
| root		| 0	|					| aaa-file-skel	|
| bin		| 1	|					| aaa-file-skel	|
| sys		| 2	|					| aaa-file-skel	|
| kmem		| 3	| Users who can read /dev/mem		| aaa-file-skel	|
| tty		| 4	| Users who can read and write to ttys	| aaa-file-skel	|
| tape		| 5	|					| aaa-file-skel	|
| daemon	| 6	|					| aaa-file-skel	|
| floppy	| 7	|					| aaa-file-skel	|
| disk		| 8	|					| aaa-file-skel	|
| lp		| 9	|					| aaa-file-skel	|
| dialout	| 10	|					| aaa-file-skel	|
| audio		| 11	|					| aaa-file-skel	|
| video		| 12	|					| aaa-file-skel	|
| utmp		| 13	|					| aaa-file-skel	|
| usb		| 14	|					| aaa-file-skel	|
| cdrom		| 15	|					| aaa-file-skel	|
| shadow	| 16	| Users who can read /etc/shadow 	| aaa-file-skel	|
| dbus		| 17	| Dbus message daemon			| aaa-file-skel	|
| _sshd		| 22	| OpenSSH Privsep Group			| openssh	|
| _httpd	| 80	| nginx Privsep Group			| nginx		|
| _ntpd		| 123	| OpenNTPD Privsep Group		| openntpd	|

Note that UIDs and GIDs in the range 200-400 are used by pkgsrc. They are
documented in the `util/pkgsrc/create-user-groups.sh` shell script.

