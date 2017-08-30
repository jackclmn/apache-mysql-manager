# init.pp
class apache_mysql_manager (
  Hash $vhosts,
  Hash $dbs,
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

  contain ::mysql::server

  $dbs.each |$db, $attributes| {
    mysql::db { $db:
      user     => 'myuser',
      password => 'password',
      host     => 'localhost',
      grant    => ['SELECT', 'UPDATE'],
    }
  }
}
