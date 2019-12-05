software-properties-common:
  pkg.installed:
    - refresh: True
    - prereq:
      - glusterfs-server-pkg

glusterfs-ppa:
  pkgrepo.managed:
    - humanname: GlusterFS PPA
    - name: ppa:gluster/glusterfs-{{ pillar["glusterfs"]["version"] }}
    - prereq:
      - glusterfs-server-pkg

glusterfs-server-pkg:
  pkg.installed:
    - name: glusterfs-server
    - refresh: True
    - hold: True