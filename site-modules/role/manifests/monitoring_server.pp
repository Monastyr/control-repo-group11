class role::monitoring_server {
  include ::profile::base_linux
  include ::profile::dns::client
  include ::profile::consul::server
 # include ::profile::sensu::backend
  include ::wordpress::monitor
}
