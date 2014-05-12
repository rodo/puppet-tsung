#
# configure ssh acces auth with key
#
class tsung::credentials ($username='tsung', $group='tsung')
{
  
  file { "/home/$username/.ssh":
    ensure  => directory,
    group   => $group,
    owner   => $username,
    mode    => 0700,
  }

  file { "/home/$username/.ssh/authorized_keys":
    ensure  => present,
    group   => $group,
    owner   => $username,
    mode    => 0600,
    source  => "puppet:///modules/tsung/id_dsa.pub"
  }

  file { "/home/$username/.ssh/id_dsa":
    ensure  => present,
    group   => $group,
    owner   => $username,
    mode    => 0600,
    source  => "puppet:///modules/tsung/id_dsa"
  }

  file { "/home/$username/.ssh/id_dsa.pub":
    ensure  => present,
    group   => $group,
    owner   => $username,
    mode    => 0600,
    source  => "puppet:///modules/tsung/id_dsa.pub"
  }

  file { "/home/$username/.ssh/config":
    ensure  => present,
    group   => $group,
    owner   => $username,
    mode    => 0600,
    source  => "puppet:///modules/tsung/config"
  }

}
