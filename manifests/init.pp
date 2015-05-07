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
  
  user { 'koala':
    ensure => present,
    shell => '/bin/bash',
    managehome => true,
  }

  vcsrepo { "~koala/koala":
    ensure   => latest,
    owner    => koala,
    provider => git,
    source   => "git@github.com:MichaelMcKechnie/koala_puppet.git",
  }

  file { '~koala/koala':
    ensure => directory,
    mode => '0770',
  }

  cron { 'koala pull':
    command => 'cd ~koala/koala && git pull 2>&1 | logger -t "koala pull"',
    minute => '*/5',
  }  
  
  file { '~koala/.ssh':
    ensure => directory,
    mode => '0700',
  }

  cron { 'puppet apply':
    command => 'cd ~koala && puppet apply koala 2>&1 | logger -t "puppet apply"',
    minute => '*/5',
  }  
}
