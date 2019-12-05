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

'ufw allow ssh && ufw limit ssh':
  cmd.run:
    - watch:
      - service: ufw

'ufw allow salt-master':
  cmd.run:
    - watch:
      - service: ufw

{% if pillar["ufw"]["private_subnets"] %}
{% for subnet in pillar["ufw"]["private_subnets"] %}
'ufw allow from {{ subnet }}':
  cmd.run:
    - watch:
      - service: ufw
{% endfor %}
{% endif %}
