# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configuration variables.
VAGRANTFILE_API_VERSION = "2"

BOX = 'debian/stretch64'
GUI = false
CPU = 2
RAM = 2048

DOMAIN  = "ckan-tib-vagrant"
HOSTS = {
  "ckan-tib-vagrant" => [2, 2048, GUI, BOX],
}


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = true

  HOSTS.each do | (name, cfg) |
   cpu, ram, gui, box = cfg

    config.vm.define name do |machine|
      machine.vm.box = box

      machine.vm.provider "virtualbox" do |vbox|
        vbox.gui    = gui
        vbox.cpus   = cpu
        vbox.memory = ram
        vbox.name   = name
        vbox.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
      end

      machine.vm.hostname = name + DOMAIN
      machine.vm.network 'public_network', bridge: [
                                             "en1: enxc8f750a9129d",
                                             "en6: Intel PRO/1000 MT Desktop (82540EM)",
                                           ]
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      machine.vm.provision "shell", path: "vagrant/basic_installation.sh"
      machine.vm.provision "shell",
        inline: "sudo timedatectl set-timezone Europe/Amsterdam", run: "always"
    end
  end


end