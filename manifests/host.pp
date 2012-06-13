define dhcp::host ( $address,
                    $mac_addr) {

  concat::fragment {
    "host-$name":
      target  => '/etc/dhcpd.conf',
      order   => 30,
      content => template('dhcp/host.erb');
  }

}
