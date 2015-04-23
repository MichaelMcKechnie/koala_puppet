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

  cron { 'Koala pull':
    command => 'cd ~/Koala && git pull >> ~/git.log 2>&1',
    minute => '*/5',
  }  

  cron { 'Puppet apply':
    command => 'cd ~ && puppet apply Koala >> ~/puppet.log 2>&1',
    minute => '*/5',
  }  
}
