# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Configuration variables.
VAGRANTFILE_API_VERSION = "2"


DOMAIN  = 'ckan'
name = 'test123'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = true


    config.vm.define name do |machine|
      machine.vm.box = 'debian/stretch64'
      machine.vm.box_version = "9.8.0"

      machine.vm.provider "virtualbox" do |vbox|
        vbox.gui    = true
        vbox.cpus   = 2
        vbox.memory = 2048
        vbox.name   = name
      end

      machine.vm.hostname = name + DOMAIN
      machine.vm.network "private_network",  ip: "192.168.10.50"
      machine.vm.provision "shell", inline: "sudo timedatectl set-timezone Europe/Amsterdam", run: "always"
      machine.vm.provision "ansible_local" do |ansible|
          ansible.playbook = "playbook-ckan.yml"
          ansible.install_mode = "pip"
          ansible.version = "2.8.0"
          ansible.verbose = "vvv"
        end

    end


end
