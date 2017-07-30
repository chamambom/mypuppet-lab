class myservices::accounts {
  $rootgroup = $osfamily ? {
    'Debian'  => 'sudo',
    'RedHat'  => 'wheel',
    default   => warning('This distribution is not supported by the Accounts module'),
  }
  include myservices::groups
  include myservices::ssh
  user { 'denzel':
    ensure      => present,
    home        => '/home/denzel',
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'denzel',
    groups      => "$rootgroup",
    }
  
}