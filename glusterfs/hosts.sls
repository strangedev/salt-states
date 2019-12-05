{% for host in pillar["glusterfs"]["hosts"] %}
  {% for ip_address in host["ip_addresses"] %}
glusterfs-hosts:
  file.line:
    - name: /etc/hosts
    - content: '{{ ip_address }} {% for hostname in host["host"] %}{{ hostname }} {% endfor %}'
    - mode: ensure
    - backup: True
  {% endfor %}
{% endfor %}