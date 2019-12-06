{% for host in pillar["glusterfs"]["hosts"] %}
{% if grains["host"] not in host["hostnames"] %}
glusterfs-host-{{ host["ip_address"] }}:
  host.present:
    - names: {{ host["hostnames"] }}
    - ip: {{ host["ip_address"] }}
{% endif %}
{% endfor %}