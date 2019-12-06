{% for host in pillar["glusterfs"]["hosts"] %}
glusterfs-host-{{ host["ip_address"] }}:
  host.present:
    - names: {{ host["hostnames"] }}
    - ip: {{ host["ip_address"] }}
{% endfor %}