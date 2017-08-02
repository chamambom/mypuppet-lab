class apache::configvhosts {
        
  if $::osfamily == 'RedHat' {
    file { '/etc/httpd/conf.d/vhost.conf':
      ensure    => file,
      content   => template('apache/vhosts-rh.conf.erb'),
    }
    file { "/var/www/$fqdn":
      ensure    => directory,
    }
    file { "/var/www/$fqdn/public_html":
      ensure    => directory,
    }
    #file { "/var/www/$hostname/log":
    #ensure    => directory,
    #}
        
  } elsif $::osfamily == 'Debian' {
    file { "/etc/apache2/sites-available/$fqdn.conf":
      ensure  => file,
      content  => template('apache/vhosts-deb.conf.erb'),
    }
    file { "/var/www/$fqdn":
      ensure    => directory,
    }
    file { "/var/www/html/$fqdn/public_html":
      ensure    => directory,
    }
    #file { "/var/www/html/$hostname/logs":
    #  ensure    => directory,
    #}
  } else {
    print "This is not a supported distro."
  }
        
}