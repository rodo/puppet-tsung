puppet-tsung
============

Puppet module to install tsung from source

This module only install dependencies to run tsung, the perl scripts
distribute will not work, you'll have to install by your own gnuplot
ans libtemplate-perl on the controller.

TESTED ON
=========

* Ubuntu 14.04 LTS 64 Bits (puppet agent 3.3)

* Ubuntu 12.04 LTS 64 Bits (puppet agent 3.3)

* Debian Wheezy 7.4

Ubuntu releases were tested on OpenStack VM and Amazon EC2 instance

INSTALL
=======

clone this repository in /etc/puppet/modules/tsung

On puppet master :

    # cd /etc/puppet/modules

    # git clone https://github.com/rodo/puppet-tsung.git tsung

CONFIGURE
=========

You'll need to have at least one ssh key present in files/ see the
file `files/README` to generate it.

DISCLAIMER
==========

By default all tsung hosts will have the same ssh key, you only need
to have ssh access between the controller to other nodes, it's
possible to improve this part. To keep this puppet receipe simple we
only use one key.

Ssh host checking is disabled, if you don't want this, change the
`files/config` and initialise all connection bettween your nodes.
