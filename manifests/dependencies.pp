#
#
#
class tsung::dependencies {

  package { "git": ensure => present }
  package { "autoconf": ensure => present }
  package { "automake": ensure => present }
  package { "make": ensure => present }
  package { "erlang-base": ensure => present }

  package { "erlang-crypto":
    ensure => present,
    require => Package['erlang-base']
  }
  
  package { "erlang-eunit":
    ensure => present,
    require => Package['erlang-crypto']
  }

  package { "erlang-inets":
    ensure => present,
    require => Package['erlang-eunit']
  }

  package { "erlang-snmp":
    ensure => present,
    require => Package['erlang-inets']
  }

  package { "erlang-ssl":
    ensure => present,
    require => Package['erlang-snmp']
  }
  
  package { "erlang-xmerl":
    ensure => present,
    require => Package['erlang-ssl']
  }

  package { "erlang-dev":
    ensure => present,
    require => Package['erlang-xmerl']
  }
}
