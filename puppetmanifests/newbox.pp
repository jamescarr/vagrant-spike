class lucid32 {
  include mongodb
  group { 'puppet': ensure => 'present' }
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  package { "apache2":
    ensure    => present,
    require => Exec['apt-get update']
  }

  package { "vim":
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
}

include lucid32
