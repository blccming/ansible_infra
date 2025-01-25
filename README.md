# ansible_infra

This playbook is used to manage my personal infrastructure with IaC via Ansible.

## Run the playbook

1. Create ssh key and copy the key to the server
```bash
export SSH_USER="bloom"
ssh-keygen -t ed25519 -C "$SSH_USER"
ssh-add ~/.ssh/$SSH_USER
ssh-copy-id -i ~/.ssh/$SSH_USER $SSH_USER@<SERVER-IP>
ssh $SSH_USER@<SERVER-IP>
```

2. Check inventory.ini for correct information about the server(s)

3. Run run.sh
```bash
sh run.sh
```

> [!IMPORTANT]
> When running Authelia behind a cloud proxy (e.g. cloudflare) make sure to [remove the X-Forwarded-For header](https://www.authelia.com/integration/proxies/forwarded-headers/).

## Edit secrets

1. Create .vault_pass and paste the password into it


2. Use ansible-vault to edit `./group_vars/all/secrets.yml`
```bash
ansible-vault edit --vault-password-file=.vault_pass ./group_vars/all/secrets.yml
```

> [!NOTE]
> Look at [examples/group_vars/all/secrets.yml](https://github.com/blccming/ansible_infra/blob/master/examples/group_vars/all/secrets.yml) for creating your own `secrets.yml`

## Special thanks

- [notthebee](https://github.com/notthebee) for his ansible [playbook](https://github.com/notthebee/infra) and [youtube series](https://yewtu.be/playlist?list=PLkxWXio1KmRoZd88WbrnSnQM5MJY5PjH2)
