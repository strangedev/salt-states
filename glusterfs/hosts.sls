{% for host in pillar["glusterfs"]["hosts"] %}
glusterfs-host-{{ host["ip_address"] }}:
  file.append:
    - name: /etc/hosts
    - text: '{{ host["ip_address"] }} {% for hostname in host["hostnames"] %}{{ hostname }} {% endfor %}'
{% endfor %}