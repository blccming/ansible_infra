#### servers
rosa
- make wwn a list to support more than one drive per pool
  - group_vars/srv_rosa/vars.yml
- notifications (via mail or signal?)
  - performed an update
  - ssh login
  - zfs keyfile accessed
  - health check fails

clara
- authelia
  - [Prerequisites](https://www.authelia.com/integration/prologue/get-started/)
  - [LLDAP](https://github.com/lldap/lldap?tab=readme-ov-file#with-docker)
  - configure for
    - immich
    - jellyfin
    - nextcloud
    - soon: [piped](https://github.com/TeamPiped/Piped/pull/2571)
    - syncthing, [!!!](https://forum.syncthing.net/t/hide-no-authentication-warning-when-external-auth-already-exists/17742/8)
      - enforce with reverse proxy / no internal integration
    - transmission and *arr
- [caddy integration](https://www.authelia.com/integration/proxies/caddy/)

#### personal computers
both
- Fedora with Gnome
- Icon: https://github.com/somepaulo/MoreWaita
- gpg key for git/github

karl

rudi
