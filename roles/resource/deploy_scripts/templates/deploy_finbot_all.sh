#!/bin/bash

source /opt/ansible/bin/activate && \
cd /root/bootstrap && \
ansible-playbook -i "localhost," -c local bootstrap.yml
