# Class: koala
#
# This module manages koala
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class koala {
  package { ['git', 'docker']:
    ensure => present,
  }
  
  service { 'docker':
    ensure => running,
    enable => true,
  }
  
  file { '~/.ssh':
    ensure => directory,
    mode => '0700',
  }
}
