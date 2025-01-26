ansible-galaxy install -r requirements.yml -p roles/ --force
ansible-playbook --vault-password-file=.vault_pass -u bloom -i inventory.ini playbook.yml
