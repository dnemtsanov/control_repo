node default {
  file { '/root/README':
    ensure => file,
    content => 'This is a readme',
    owner   => 'root',
  }
}
node 'master.puppet.vm' {
  include role::master_server
}
node /^web/ { 
  include role::app_server
}
node /^db/ {
  include role::db_server
}
class { 'docker':
  use_upstream_package_source => false,
}
