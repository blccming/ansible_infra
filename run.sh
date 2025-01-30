#!/bin/bash
ansible-galaxy install -r requirements.yml -p roles/ # use --force for updating
ansible-galaxy collection install community.docker
ansible-playbook --vault-password-file=.vault_pass -u bloom -i inventory.ini playbook.yml
