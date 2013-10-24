# Class: puppetdb::prerequisites
#
# This class installs puppetdb prerequisites
#
# == Variables
#
# Refer to puppetdb class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by puppetdb if the parameter
# install_prerequisites is set to true
# Note: This class may contain resources available on the
# Example42 modules set
#
class puppetdb::prerequisites {

  case $::operatingsystem {
    redhat,centos,scientific,oraclelinux : {
      require yum::repo::puppetlabs
    }
    ubuntu,debian : {
      require apt::repo::puppetlabs
    }
    default: { }
  }
}
