class dhcp {

  package {
    'dhcp':
      ensure => installed;
  }

  service {
    'dhcpd':
      ensure    => running,
      enable    => true,
      hasstatus => true,
      require   => Package['dhcp'];
  }

  include concat::setup

  concat {
    '/etc/dhcpd.conf':
      owner  => 'root',
      group  => 'root',
      mode   => 0644,
      notify => Service['dhcpd'];
  }

  concat::fragment {
    'header':
      target => '/etc/dhcpd.conf',
      order  => 0,
      source => 'puppet:///modules/dhcp/dhcpd_header.conf'
  }

}
