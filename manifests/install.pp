#
# Will install tsung with src /home/tsung/tsung
#
#
class tsung::install
(
  $dir='/home/tsung/tsung/',
  $username='tsung')
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

    exec { "git checkout $tsung_tag":
      cwd => $dir,
      command => '/bin/sh -c "cd tsung/ ; git checkout $tsung_tag"',
      logoutput => on_failure,
      onlyif => ["test -d $dir"],
      require => Package['git']
      } ->

      exec { "git pull":
        cwd => $dir,
        command => '/bin/sh -c "cd tsung/ ; git pull origin master"',
        logoutput => on_failure,
        onlyif => ["test -d $dir"],
        require => Package['git']
        }
        
}
