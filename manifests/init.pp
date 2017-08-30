# init.pp
class apache_mysql_manager (
  Hash $vhosts,
  ){
  class { 'apache':
    default_vhost => false,
  }
  contain apache

  $vhosts.each |$vhost, $attributes| {
    apache::vhost { $vhost:
      port    => $attributes['port'],
      docroot => $attributes['docroot'],
    }
  }
}
