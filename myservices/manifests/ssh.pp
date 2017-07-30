class myservices::ssh {

$sshname = $osfamily ? {
    'Debian'  => 'ssh',
    'RedHat'  => 'sshd',
    default   => warning('This distribution is not supported by the Accounts module'),
  }

  file { '/etc/ssh/sshd_config':
    ensure  => present,
    source  => 'puppet:///modules/myservices/sshd_config',
    notify  => Service["$sshname"],
  }
        
  service { "$sshname":
    hasrestart  => true,
  }
}