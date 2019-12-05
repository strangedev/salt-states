include:
  - ufw.service

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

ufw-allow-ssh:
  cmd.run:
    - name: 'ufw allow ssh && ufw limit ssh'
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

'ufw enable':
  cmd.run:
    - require:
      - ufw-allow-ssh