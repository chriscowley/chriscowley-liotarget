# == Class liotarget::service
#
# This class is meant to be called from liotarget
# It ensure the service is running
#
class liotarget::service {

  service { $liotarget::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
