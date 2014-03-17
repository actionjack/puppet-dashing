# == Class: dashing
#
# Full description of class dashing here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { dashing:
#    dashing_dir    => '/opt/dashing',
#    gem_home       => '/usr/local/lib/ruby/gems/1.9.1'
#    manage_service => true
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class dashing (
  $daemon_dir     = '/usr/local/bin',
  $dashing_dir    = undef,
  $dashing_port   = 3030,
  $gem_home       = undef,
  $manage_service = true
) {

  validate_absolute_path($daemon_dir)
  validate_absolute_path($dashing_dir)
  validate_re('^\d{4,5}$')
  validate_absolute_path($gem_home)
  validate_bool($manage_service)

  class { 'dashing::install': } ->
  class { 'dashing::config':
    daemon_dir   => $dashing::daemon_dir,
    dashing_dir  => $dashing::dashing_dir,
    dashing_port => $dashing::dashing_port,
    gem_home     => $dashing::gem_home,
  }
  if $manage_service == true {
    class { 'dashing::service':
      require    => Class['dashing::config']
    }
  }

}
