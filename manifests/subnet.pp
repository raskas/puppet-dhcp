define dhcp::subnet ( $netmask,
                      $imageserver='',
                      $router='',
                      $imageserver_name='',
                      $range_start='',
                      $range_end='',
                      $domain_name='',
                      $domain_name_servers='') {

  include dhcp

  $subnet=$name

  concat::fragment {
    "subnet-$name":
      target  => '/etc/dhcpd.conf',
      order   => 20,
      content => template('dhcp/subnet.erb');
  }

}
