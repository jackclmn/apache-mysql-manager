# init.pp
class apache_mysql_manager (
  Hash $vhosts,
  ){
  class { 'apache':
    default_vhost => false,
  }

  $vhosts.each |$vhost, $attributes| {
    apache::vhost { $vhost:
      port    => $attributes['port'],
      docroot => $attributes['docroot'],
    }
  }
}
