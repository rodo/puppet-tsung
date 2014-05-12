#
# configure ssh acces auth with key
#
class tsung::credentials
(
  $username='tsung',
  $group='tsung'
)
{
  
  file { '/home/${username}/.ssh':
    ensure  => directory,
    group   => $group,
    owner   => $username,
    mode    => 0700,
  }

  file { '/home/${username}/.ssh/authorized_keys':
    ensure  => present,
    group   => $group,
    owner   => $username,
    mode    => 0700,
    source  => "puppet:///modules/tsung/id_dsa.pub"
  }

  
}
