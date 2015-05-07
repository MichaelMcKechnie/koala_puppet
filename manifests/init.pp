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
  package { ['git', 'puppet']:
    ensure => present,
  }
  
  service { 'puppet':
    ensure => running,
    enable => true,
  }
  
  file { '~/.ssh':
    ensure => directory,
    mode => '0700',
  }

  cron { 'koala pull':
    command => 'cd ~/koala && git pull 2>&1 | logger -t "koala pull"',
    minute => '*/5',
  }  

  cron { 'Puppet apply':
    command => 'cd ~ && puppet apply koala 2>&1 | logger -t "puppet apply"',
    minute => '*/5',
  }  
}
