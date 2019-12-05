include:
  - ufw.service

'ufw default deny':
  cmd.run

ufw-allow-ssh:
  cmd.run:
    - name: 'ufw allow ssh && ufw limit ssh'

{% if pillar["ufw"]["trusted_subnets"] %}
{% for subnet in pillar["ufw"]["trusted_subnets"] %}
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