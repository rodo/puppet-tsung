#
# Will install tsung with src /home/tsung/tsung
#
#
class tsung::install
(
  $dir='/home/tsung/tsung/',
  $username='tsung')
{

  file { '/home/${username}':
    ensure  => directory,
    group   => $group,
    owner   => $username,
    mode    => 0744,
  }

  Exec {
    user => 'tsung',
    cwd => '/home/tsung',
    timeout => '0',
    path => '/usr/bin:/bin',
    environment => ['SHELL=/bin/bash'],
  }

  exec { "git clone from github":
    cwd => '/home/tsung',
    command => 'git clone -b master https://github.com/processone/tsung.git tsung',
    logoutput => on_failure,
    onlyif => ["test ! -d $dir"],
    } ->

    exec { "git pull":
      cwd => $dir,
      command => '/bin/sh -c "cd tsung/ ; git pull"',
      logoutput => on_failure,
      onlyif => ["test -d $dir"],
      } ->
      

      exec { "./configure in $dir":
        command => '/bin/sh -c ./configure',
        cwd => $dir,
        logoutput => on_failure,
        } ->
        
        exec { "make in $dir":
   	  cwd => $dir,
   	  command => 'make',
          } ->
          
          exec { "make install in $dir":
   	    cwd => $dir,
   	    user => 'root',
   	    command => 'make install',
          }
          
}
