#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers

# https://app.vagrantup.com/centos/boxes/7
vagrant box add "centos/7" --provider=libvirt
vagrant init --template Vagrantfile.template.erb
# must be created in project root directory with Vagrantfile template file
vagrant up --provider=libvirt "vg-compute-13" 


vagrant box list #veridy installed boxes
vagrant status #Check the status of the VMs to see that none of them have been created yet
vagrant status
virsh list --all #show all running KVM/libvirt VMs
# vagrant destroy -f "vg-compute-05"


echo "========================================================================================="
