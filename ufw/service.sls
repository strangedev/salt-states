ufw:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: ufw
      - file: /etc/ufw/*