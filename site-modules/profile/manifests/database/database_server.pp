class profile::database::database_server{


class { '::mysql::server':
  root_password           => 'password',
  restart                		  => true,
  override_options        => $override_options
}


$override_options = {
  'mysqld' => {
    'bind-address' => 'db.node.consul',
  }
}
mysql::db { 'wordpress':
  user     => 'wordpress',
  password => 'wordpress',
  host     => 'db.node.consul',
  grant    => ['SELECT', 'UPDATE'],
}

}