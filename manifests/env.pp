#
#
#
class tsung::env ($username='tsung') {

  $group = $username

  group { $username:
    ensure  => present,
    gid     => 2000,
  }

  user { $username:
    ensure  => present,
    gid     => $group,
    require => Group[$group],
    uid     => 2000,
    home    => "/home/${username}",
    shell   => "/bin/bash",
    managehome  => true,
  }

  file {"/home/tsung/.profile":
    ensure => present,
    owner  => $username,
    group  => $group,
    mode   => 0644,
    source => "puppet:///modules/tsung/profile",

  }

}
