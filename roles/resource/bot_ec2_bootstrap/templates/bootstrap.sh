#!/bin/bash

source /root/.bash_profile

function write_env_var () {
	mkdir -p /root/bootstrap/vars
	echo -e "---\n\nlocal_${1}: \"${2}\"" > /root/bootstrap/vars/$1.yml
}

pwd
whoami

yum groupinstall "Development tools" -y

virtualenv --system-site-packages /opt/ansible
source /opt/ansible/bin/activate

pip install six
pip install boto
pip install botocore
pip install boto3
pip install dnspython
pip install ansible==2.3

write_env_var "vault_password" "{{ ansible_vault_password }}"
write_env_var "codecommit_username" "{{ ansible_codecommit_username }}"
write_env_var "codecommit_password" "{{ ansible_codecommit_password }}"

source /opt/ansible/bin/activate && \
cd /root/bootstrap && \
ansible-playbook -i "localhost," -c local bootstrap.yml >> /var/log/bootstrap.log 2>&1

# run all of it
echo '0,15,30,45 * * * * root /usr/local/bin/dfa >> /var/log/bootstrap.log 2>&1' > /etc/cron.d/bootstrap

# deploy code only
echo '5,10,20,25,35,40,50,55 * * * * root /usr/local/bin/dfc >> /var/log/bootstrap.log 2>&1' >> /etc/cron.d/bootstrap
