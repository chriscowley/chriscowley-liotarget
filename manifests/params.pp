# == Class liotarget::params
#
class liotarget::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name = 'targetcli'
    }
    'Debian': {
      $package_name = 'targetcli'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
