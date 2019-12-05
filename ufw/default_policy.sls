include:
  - ufw.service

'ufw enable':
  cmd.run

# these are iptables rules which mitigate some common attacks
/etc/ufw/before.rules:
  file.managed:
    - source: salt://ufw/iptables/before.rules

/etc/ufw/before6.rules:
  file.managed:
    - source: salt://ufw/iptables/before.rules

'ufw default deny':
  cmd.run:
    - watch:
      - service: ufw

{% if pillar["ufw"]["private_subnet"] %}
'ufw allow from {{ pillar["ufw"]["private_subnet"] }}':
  cmd.run:
    - watch:
      - service: ufw
{% endif %}
