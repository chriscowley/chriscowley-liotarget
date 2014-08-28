# == Class liotarget::install
#
class liotarget::install {
    package { $liotarget::package_name:
      ensure => present,
    }
}
