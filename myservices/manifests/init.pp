class myservices {


  package { 'vsftpd':

  ensure => 'present',

}

  service { 'vsftpd':

  ensure => 'running',

  enable => true,

  require => Package['vsftpd'],

}

}