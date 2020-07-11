Fidelix Firewall Configuration
==============================

Introduction
------------

Fidelix uses the iptables firewall. This document is intended to provide an
overview of the default firewall configuration and how iptables integrates with
Fidelix. It is not intended to be guide on how to use iptables. If you are
unfamiliar with the basics of iptables, [this DigitalOcean
guide](https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands)
is a good reference.

Default Configuration
---------------------

Fidelix comes with a default iptables configuration for both IPv4 and IPv6.
By default, iptables is configured to allow all outbound traffic, drop all
forwarding traffic, and drop most inbound traffic. The following inbound
traffic is accepted by default:
* Stateful traffic
* Anything on the loopback interface
* The following ICMP types:
  * echo-request
  * echo-reply
  * destination-unreachable
  * time-exceeded
  * parameter-problem
  * router-advertisement (IPv6 only)
  * neighbor-solicitation (IPv6 only)
  * neighbor-advertisement (IPv6 only)

All other inbound traffic is dropped by default. This includes inbound traffic
for all services. When you enable a service, be sure to also create any
necessary firewall rules for the service to be properly available on the
network.

If this seems a bit draconian, the rationale behind these rules is a follows:
Fidelix is designed to be secure by default. To further this objective, very
little traffic is allowed through by default. This prevents services from
unintentionally being exposed over the network and requires the system
administrator to explicitly allow each service he wants to pass through the
firewall. The hope is that in doing this, the system administrator will be more
likely to think about and research the security impacts of enabling each
service.

Firewall Rule Persistence
-------------------------

### How the Fidelix Persistent Firewall Works
Fidelix provides the iptables and ip6tables services to handle the loading of
firewall rules on boot. When starting, the iptables and ip6tables services
first check if the files `/etc/iptables/rules4` and `/etc/iptables/rules6` exist
respectively. If they do exist, they are loaded as they firewall rules using
`iptables-restore` and `ip6tables-restore`. If they do not exist, then the
files `/etc/iptables/rules4.default` and `/etc/iptables/rules6.default` are
loaded instead. Note that it is possible for one service to use `rules?` and
the other to use `rules?.default`.

When the iptables and ip6tables services are stopped, they clear the respective
firewall rule set and configure iptables/ip6tables to accept all traffic (this
is the default firewall state on boot if the iptables/ip6tables services are
not started).

### Making your Iptables Rules Persistent
To make your firewall rules persistent, all that is required is for you to save them to the `/etc/iptables/rules4` and `/etc/iptables/rules6` files, like so:

    iptables-save > /etc/iptables/rules4
    ip6tables-save > /etc/iptables/rules6

Note that when you do this for the first time, the files will be created as
world readable. This creates a potential security hazard as any user on the
system will be able to view the firewall rules. Ensure only root can read them:

    chmod 600 /etc/iptables/rules4
    chmod 600 /etc/iptables/rules6

