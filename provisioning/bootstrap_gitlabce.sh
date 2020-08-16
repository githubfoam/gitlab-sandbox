#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

hostnamectl set-hostname vg-checkmk-client
echo "192.168.16.18 vg-gitlabce.local vg-gitlabce" |sudo tee -a /etc/hosts
echo "name: nameserver, ip: 8.8.8.8 " |sudo tee -a /etc/resolv.conf

# https://about.gitlab.com/install/?version=ce#centos-7
echo "==================================deploy gitlab ce edition=================================================="
# Install and configure the necessary dependencies 
yum install -y curl policycoreutils-python openssh-server openssh-clients
systemctl enable sshd
systemctl start sshd

firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
systemctl reload firewalld

# Install Postfix to send notification emails
yum install -y postfix
systemctl enable postfix
systemctl start postfix

# Add the GitLab package repository and install the package 
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | bash

# Install the GitLab 
# Change https://gitlab.example.com to the URL at which you want to access your GitLab instance
EXTERNAL_URL="https://192.168.16.18" yum install -y gitlab-ce

curl https://192.168.16.18
