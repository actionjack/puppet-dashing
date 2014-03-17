# = Class dashing::config
class dashing::config (
  $daemon_dir   = undef,
  $dashing_dir  = undef,
  $dashing_port = undef,
  $gem_home     = undef
) {

  file {'/etc/init.d/dashing':
    ensure  => 'present',
    content => template('dashing/dashboard.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0755'
  }

}