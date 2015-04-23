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
  package { 'git':
    ensure => installed,
  }
  
  file { '~/.ssh':
    ensure => directory,
    mode => '0700',
  }
}
