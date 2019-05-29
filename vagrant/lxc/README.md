#### Before using vagrant-lxc install:
sudo apt-get install lxc bridge-utils
vagrant plugin install vagrant-lxc

#### Load required kernel modules
sudo modprobe iptable_filter
sudo modprobe ip6table_filter

#### you probably need to add the following to /etc/modules and reboot:
veth

