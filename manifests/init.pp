#
#
# Last stable version
#
class tsung {
  $tsung_target = 'v1.5.1'
  
  class { tsung::env: }
  class { tsung::dependencies: }
  class { tsung::credentials: }
  class { tsung::install: }
  class { tsung::build: }
}
