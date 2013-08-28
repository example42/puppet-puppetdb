# Class: puppetdb::params
#
# This class defines default parameters used by the main module class puppetdb
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to puppetdb class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class puppetdb::params {

  ### Module specific parameters
  $db_type = 'hsqldb'
  $db_host = 'localhost'
  $db_port = '5432'
  $db_name = 'puppetdb'
  $db_user = 'puppetdb'
  $db_password = fqdn_rand(100000000000)

  $install_prerequisites = true

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $service = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'java',
  }

  $process_args = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $process_user = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/puppetdb/conf.d',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/puppetdb/conf.d/database.ini',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0640',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'puppetdb',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/puppetdb',
    default                   => '/etc/sysconfig/puppetdb',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/puppetdb.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/puppetdb',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/puppetdb',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/puppetdb/puppetdb.log',
  }

  $https_host = $::fqdn
  $https_port = '8081'
  $http_host  = ''    # HTTPS only by default
  $http_port  = '8080'
  $protocol   = 'tcp'

  # General Settings
  $my_class            = ''
  $source              = ''
  $source_dir          = ''
  $source_dir_purge    = false
  $template            = 'puppetdb/database.ini.erb'
  $options             = ''
  $service_autorestart = true
  $version             = 'present'
  $absent              = false
  $disable             = false
  $disableboot         = false

  ### General module variables that can have a site or per module default
  $monitor        = false
  $monitor_tool   = ''
  $monitor_target = '127.0.0.1'
  $firewall       = false
  $firewall_tool  = ''
  $firewall_src   = '0.0.0.0/0'
  $firewall_dst   = $::ipaddress
  $puppi          = false
  $puppi_helper   = 'standard'
  $debug          = false
  $audit_only     = false

}
# vim:shiftwidth=2:tabstop=2:softtabstop=2:expandtab:smartindent

