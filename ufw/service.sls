ufw:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ufw/*