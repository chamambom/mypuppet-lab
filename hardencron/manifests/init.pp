# Class: hardencron
#
# This module manages hardencron
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class hardencron {
  notify { 'Applying class hardencron':}
  
  file {"/etc/cron.deny":
        ensure => absent,
        }
 
  file {"/etc/cron.allow":
        ensure => present,
        owner => "root",
        group => "root",
        mode => "600"
       }

}
