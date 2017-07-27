class myservices {

    package { 'vsftpd':
    ensure => 'present',

  }

    service { 'vsftpd':
    ensure => 'running',
    enable => true,
    require => Package['vsftpd'],
  }

    package { 'httpd':
    ensure => 'present',
          }
    service {'httpd':
    ensure => 'running',
    require => Package["httpd"],
           }

}