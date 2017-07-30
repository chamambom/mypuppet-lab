class myservices::accounts {
  include groups
  user { "denzel":
    ensure      => present,
    home        => "/home/denzel",
    shell       => "/bin/bash",
    managehome  => true,
    gid         => "denzel",
    }
  
}