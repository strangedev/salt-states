base:  # 'base' environment
  '*':
    - ohmyzsh
    - ssh
    - editor
    - users
    - ufw
    - glusterfs

  '*swarm*':
    - docker