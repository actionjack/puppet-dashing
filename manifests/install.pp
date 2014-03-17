# = Class dashing::install
class dashing::install {
  package { 'dashing':
    ensure   => 'present',
    provider => 'gem'
  }
}