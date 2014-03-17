# = Class dashing::config
class dashing::config (
  $daemon_dir,
  $dashing_dir,
  $dashing_port,
  $gem_home,
) {

  file {'/etc/init.d/dashing':
    ensure  => 'present',
    content => template('dashing/dashboard.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => 0755
  }

}