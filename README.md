# ansible_infra

This playbook is used to manage my personal infrastructure with IaC via Ansible.

## Run the playbook
0. Configure the ansible vault, see the [Edit secrets section](#edit-secrets).
If needed, create `roles/containers/templates/torrenting/custom.ovpn` with your OpenVPN configuration, see the [gluetun guide](https://github.com/qdm12/gluetun-wiki/blob/main/setup/openvpn-configuration-file.md).
Also, if using authelia, create `rsa.2048.key` in `roles/containers/templates/authelia/rsa.2048.key` using `openssl genrsa -out rsa.2048.key 2048`.
Be aware that OpenID Connect as well as LDAP will need to be configured manually inside the respective client.


1. Create ssh key and copy the key to the server
```bash
export SSH_USER="bloom"
export HOST=0.0.0.0 # set accordingly

ssh-keygen -t ed25519 -C "$SSH_USER"
ssh-add ~/.ssh/$SSH_USER
ssh-copy-id -i ~/.ssh/$SSH_USER $SSH_USER@$HOST
ssh $SSH_USER@$HOST
```

2. Check inventory.ini for correct information about the server(s)

3. Run run.sh
```bash
sh run.sh
```

> [!IMPORTANT]
> When running Authelia behind a cloud proxy (e.g. Cloudflare) make sure to [remove the X-Forwarded-For header](https://www.authelia.com/integration/proxies/forwarded-headers/).
> If you are using Cloudflare, use the TLS encryption mode "Full" or "Full (strict)"!
> Also, make sure to disable DNS rebind protection in your router, in order to reach domains that point to local IP addresses.

## Edit secrets

1. Create .vault_pass and paste the password into it, if not already done


2. Use ansible-vault to edit `group_vars/all/secrets.yml`
```bash
ansible-vault edit --vault-password-file=.vault_pass ./group_vars/all/secrets.yml
```

> [!NOTE]
> Look at [examples/group_vars/all/secrets.yml](https://github.com/blccming/ansible_infra/blob/master/examples/group_vars/all/secrets.yml) for creating your own `secrets.yml`

## Special thanks

- [notthebee](https://github.com/notthebee) for his ansible [playbook](https://github.com/notthebee/infra) and [youtube series](https://yewtu.be/playlist?list=PLkxWXio1KmRoZd88WbrnSnQM5MJY5PjH2)
