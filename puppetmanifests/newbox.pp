class lucid32 {
  include mongodb

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


  file { '/etc/motd':
     content => "Welcome to Arakis"

  }
}

include lucid32
