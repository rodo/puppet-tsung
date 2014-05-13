#
# Will install tsung with src /home/tsung/tsung
#
#
class tsung::build
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



  exec { "./configure in $dir":
    command => '/bin/bash -l -c "export HOME=/home/tsung ; ./configure"',
    cwd => $dir,
    logoutput => on_failure,
    require => Package['erlang-dev','autoconf']
    } ->
    
    exec { "make in $dir":
      cwd => $dir,
      command => '/bin/bash -l -c "export HOME=/home/tsung ; make"',
      } ->
      
      exec { "make install in $dir":
   	cwd => $dir,
   	user => 'root',
   	command => '/bin/bash -l -c "make install"',
      }
          
}
