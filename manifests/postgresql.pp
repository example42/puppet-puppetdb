# Class puppetdb::postgresql
#
# Configures PostGreSQL grants for PuppetDB
#
class puppetdb::postgresql {

  case $puppetdb::db_host {
    '', 'localhost','127.0.0.1': {
      postgresql::dbcreate { $puppetdb::db_name:
        role     => $puppetdb::db_user,
        password => $puppetdb::db_password,
        address  => '127.0.0.1/32',
      }
    }
    default: {
      @@postgresql::dbcreate { $puppetdb::db_name:
        role     => $puppetdb::db_user,
        password => $puppetdb::db_password,
        address  => $::ipaddress,
        tag      => "postgresql_grants_${puppetdb::db_host}",
      }
    }
  }

}
