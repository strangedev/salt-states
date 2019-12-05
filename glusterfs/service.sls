include:
  - glusterfs.packages

glusterd:
  service.running:
    - enable: True
    - require:
      - glusterfs-server-pkg
    - watch:
      - glusterfs-server-pkg