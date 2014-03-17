# = Class dashing::service
class dashing::service (){
  service {'dashing':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true
  }
}