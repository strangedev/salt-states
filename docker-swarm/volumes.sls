{% for host in pillar["glusterfs"]["hosts"] %}
{% if grains["host"] not in host["hostnames"] %}
glusterfs-peeredwith-{{ host["hostnames"][0] }}:
  glusterfs.peeered:
    - name: {{ host["hostnames"][0] }}
{% endif %}
{% endfor %}

{% for volume in pillar["docker-swarm"]["glusterfs"]["volumes"] %}
{{ volume["name"] }}-volume-present:
  glusterfs.volume_present:
    - name: {{ volume["name"] }}
    - bricks: 
    {% for host in pillar["glusterfs"]["hosts"] %}
    {% for brick in volume["bricks"] %}
      - {{ host["hostnames"][0] }}:/data/glusterfs/{{ volume["name"] }}/{{ brick["name"] }}/brick
    {% endfor %}
    {% endfor %}
    - start: True
    - replica: {{ volume["replica_count"] }}
    - transport: tcp
    - require:
    {% for host in pillar["glusterfs"]["hosts"] %}
      - glusterfs-peeredwith-{{ host["hostnames"][0] }}
    {% endfor %}
{% endfor %}