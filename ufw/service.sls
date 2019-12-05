ufw:
  service.running:
    - enable: True
    - watch:
      - file: /etc/ufw/*