puppet-tsung
============

Puppet module to install tsung from source

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
