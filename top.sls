base:  # 'base' environment
  '*':
    - ohmyzsh
    - ssh
    - editor
    - users
    - ufw

  '*swarm*':
    - docker