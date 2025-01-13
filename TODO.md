main_rosa
- hdparm
- cronjobs / regular backups / caching script
- storage config? (jellyfin, torrenting, syncthing compose anpassen)
  - nas: ZFS (RAIDZ?)
    - ZFS pool creation first checks if it already exists
    - use ZFS encryption with key file on boot drive
  - mediapool: mergerfs w/ uncaching script
- container/tasks/services/torrenting.yml

raspi_clara
- authelia w/ lldap
