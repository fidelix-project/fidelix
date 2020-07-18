System Boot/Shutdown Process
============================

The /etc/rc.d directory contains scripts for handling system startup and
shutdown.

The Startup Process
-------------------

When the system boots, the kernel (that's Linux) performs the basic hardware
initialization. Once that is complete, it mounts the root filessytem. At this
point, /sbin/init is started as PID 1. It is then up to init to perform the
rest of the system initialization.

Once started, `init` runs the `/etc/rc.d/rc` script. This script first performs
any essential system initialization tasks, then starts any services symlinked
into /etc/rc.d/enabled, and finally runs the `/etc/rc.d/rc.local` script if it
exists and is executable.

The Shutdown Process
--------------------

When the system shuts down or reboots, `init` runs the `/etc/rc.d/rc.shutdown`
script. This script does the inverse of the `rc` script: it runs the 
`/etc/rc.d/rc.shutdown.local` script if it exists and is executable, then stops
any services symlinked into /etc/rc.d/enabled, and finally performs the
essential system shutdown tasks and powers off (or reboots) the system.

Starting/Stopping Services on Boot/Shutdown
-------------------------------------------

On boot, any services in /etc/rc.d/enabled are started in ls order. On
shutdown, any services in /etc/rc.d/enabled are stopped in reverse ls order.
Enabling/disabling services is as simple as creating/removing the symlink. Care
should be taken to ensure that any dependencies for a service will be started
before it and stopped after it.

Alternatively, one can use the `service` utility to enable and disable
services:

    service syslogd enable
    service crond disable

