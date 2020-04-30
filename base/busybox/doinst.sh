#!/bin/sh

# Setcap any necessary binaries
setcap CAP_NET_RAW=ep bin/ping
setcap CAP_NET_RAW=ep bin/ping6
setcap "CAP_SETUID=ep CAP_SETGID=ep CAP_DAC_READ_SEARCH=ep" bin/su
setcap "CAP_SETUID=ep CAP_DAC_OVERRIDE=ep" usr/bin/passwd
setcap CAP_NET_RAW=ep usr/bin/traceroute
setcap CAP_NET_RAW=ep usr/bin/traceroute6
setcap CAP_SYS_ADMIN=ep bin/mount
setcap CAP_SYS_ADMIN=ep bin/umount
setcap "CAP_SETGID=ep CAP_DAC_OVERRIDE=ep" usr/bin/crontab

