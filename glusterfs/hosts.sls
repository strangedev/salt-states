glusterfs-hosts-workaround:
  file.append:
    - name: /etc/hosts
    - text: "## SALT ANCHOR ##"

{% for host in pillar["glusterfs"]["hosts"] %}
glusterfs-hosts:
  file.line:
    - name: /etc/hosts
    - content: '{{ host["ip_address"] }} {% for hostname in host["hostnames"] %}{{ hostname }} {% endfor %}'
    - mode: ensure
    - backup: True
    - after: "## SALT ANCHOR ##"
    - require:
      - glusterfs-hosts-workaround
{% endfor %}