#
#
# Last stable version
#
class tsung {
    
  class { tsung::env: }
  class { tsung::dependencies: }
  class { tsung::credentials: }
  class { tsung::install: }
  class { tsung::build: }
}
