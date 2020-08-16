# Instruction source

# yum install lokkit
# lokkit -s http -s ssh
# package 'lokkit'
# execute 'configure lokkit' do
#   command 'lokkit -s http -s ssh'
# end

# yum install curl openssh-server cronie
# package %w(curl openssh-server cronie)

# does not work
# curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | bash

# copy file locally and run
# sudo curl  https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh -o script.rpm.sh
# + chmod and call file


# sudo yum install gitlab-ce


# sudo gitlab-ctl reconfigure