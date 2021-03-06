#
# Will install tsung with src /home/tsung/tsung
#
#
class tsung::install
(
  $dir='/home/tsung/tsung/',
  $username='tsung',
  $tsungtag = 'v1.5.1')
{

  Exec {
    user => 'tsung',
    cwd => '/home/tsung',
    timeout => '0',
    path => '/usr/bin:/bin',
    #environment => ['SHELL=/bin/bash'],
  }

  exec { "git clone from github":
    cwd => '/home/tsung',
    command => 'git clone -b master https://github.com/processone/tsung.git tsung',
    logoutput => on_failure,
    onlyif => ["test ! -d $dir"],
    require => Package['git']
    } ->

    exec { "git pull":
      cwd => $dir,
      command => 'git pull origin master',
      logoutput => on_failure,
      onlyif => ["test -d $dir"],
    } ->

    exec { "git checkout $tsungtag":
      cwd => $dir,
      command => 'git checkout v1.5.1',
      logoutput => on_failure,
      onlyif => ["test -d $dir"],
      }
      
}
