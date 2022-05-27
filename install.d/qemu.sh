#!/usr/bin/env sh

DEFAULT_NETWORK_MAC_ADDR=52:54:00:c6:ef:2f
DEFAULT_NETWORK_NETMASK=255.255.255.0
DEFAULT_NETWORK_GATEWAY=172.23.2.1
DEFAULT_NETWORK_RANGE_START=172.23.2.100
DEFAULT_NETWORK_RANGE_END=172.23.2.254

pre_install ssh

needs_install() {
  command -v /usr/bin/virsh >/dev/null || return 0
}

setup() {
  depends_on qemu libvirt virt-manager
}

postinstall() {
  sudo usermod -aG libvirt "$USER"
  sudo mkdir -p /etc/libvirt/qemu/networks/autostrart
  cat <<EONETWORK | sudo tee /etc/libvirt/qemu/networks/default.xml
<network>
  <name>default</name>
  <uuid>180e763c-7e86-4723-a24a-a91040960acb</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='$DEFAULT_NETWORK_MAC_ADDR'/>
  <ip address='$DEFAULT_NETWORK_GATEWAY' netmask='$DEFAULT_NETWORK_NETMASK'>
    <dhcp>
      <range start='$DEFAULT_NETWORK_RANGE_START' end='$DEFAULT_NETWORK_RANGE_END'/>
    </dhcp>
  </ip>
</network>
EONETWORK
  sudo ln -sf \
    /etc/libvirt/qemu/networks/default.xml \
    /etc/libvirt/qemu/networks/autostart/default.xml
}
