Fidelix Users
=============

The following users are used by packages in the base system. By convention,
users that are used by a particular service start with an underscore.

| User       | UID | GID | Description               | Package            | Home          |
| ---------- | --- | --- | ------------------------- | ------------------ | ------------- |
| root       | 0   | 0   | Root User                 | aaa-file-skel      | /root         |
| bin        | 1   | 1   | Bin                       | aaa-file-skel      | /dev/null     |
| daemon     | 6   | 6   | Daemon User               | aaa-file-skel      | /dev/null     |
| dbus       | 18  | 18  | D-Bus Message Daemon User | aaa-file-skel      | /var/run/dbus |
| _sshd      | 22  | 22  | OpenSSH Privsep User      | openssh            | /var/empty    |
| nobody     | 99  | 99  | Unprivileged User         | aaa-file-skel      | /dev/null     |

