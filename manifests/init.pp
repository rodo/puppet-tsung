#
#
#
class tsung {
  class { tsung::env: }
  class { tsung::dependencies: }
  class { tsung::credentials: }
  class { tsung::install: }
}
