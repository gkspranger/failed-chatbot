#!/bin/bash

source /opt/ansible/bin/activate && \
cd /root/bootstrap && \
ansible-playbook -i "localhost," -c local bootstrap.yml -e "bootstrap_playbook=playbooks/deploy/finbot_code.yml"
