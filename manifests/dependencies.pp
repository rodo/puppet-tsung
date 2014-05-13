#
#
#
class tsung::dependencies {

  package { "git": ensure => present }
  package { "autoconf": ensure => present }
  package { "automake": ensure => present }
  package { "make": ensure => present }
  package { "erlang-base": ensure => present }
  package { "erlang-crypto": ensure => present }
  package { "erlang-xmerl": ensure => present }
  package { "erlang-ssl": ensure => present }
  package { "erlang-snmp": ensure => present }
  package { "erlang-dev": ensure => present }
  package { "erlang-eunit": ensure => present }
  
}
