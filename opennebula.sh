#!/bin/bash
# ubuntu 16.04
apt update
apt install -y apt-transport-https

wget -q -O- https://downloads.opennebula.org/repo/repo.key | apt-key add -

echo "deb https://downloads.opennebula.org/repo/5.4/Ubuntu/16.04 stable opennebula" > /etc/apt/sources.list.d/opennebula.list

apt update
apt-get install -y opennebula opennebula-sunstone opennebula-gate opennebula-flow

/usr/share/one/install_gems --yes 

su oneadmin -c echo "oneadmin:mypassword" > /var/lib/one/.one/one_auth

systemctl start opennebula
systemctl start opennebula-sunstone

# test
oneuser show

# mysql ignore

# kvm
sudo apt-get install -y opennebula-node
sudo service libvirt-bin restart # ubuntu
