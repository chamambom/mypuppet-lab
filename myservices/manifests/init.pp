class myservices {

  service { 'vsftpd':

  ensure => 'running',

  enable => true,

  require => Package['vsftpd'],

}

}