import 'puppet-rvm'
class lucid32 {
  include mongodb
  include rvm::system


  group { 'puppet': ensure => 'present' }
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  package { ["apache2", "php5", "php5-dev"]:
    ensure    => present,
    require => Exec['apt-get update']
  }

  package { ["vim", "zsh","mercurial"]:
    ensure    => present,
    require => Exec['apt-get update']
  }

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }

  File {
    owner => 'root',
    group => 'root',
    mode => '0644'
  }

  file { '/var/www':
    ensure => link,
    target => '/vagrant',
    force => true,
    require => Package['apache2']
  }

  file { '/etc/motd':
     content => "Welcome to Arakis"

  }
  rvm_system_ruby {
    'ruby-1.9.2-p290':
      ensure => 'present',
      default_use => true;
  }
}

include lucid32
