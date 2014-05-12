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

}
