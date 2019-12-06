{% for volume in pillar["docker-swarm"]["glusterfs"]["volumes"] %}
{% for brick in volume["bricks"] %}

{{ volume["name"] }}-brick-{{ brick["name"] }}-formatted:
  blockdev.formatted:
    - name: {{ brick["device"] }}
    - fs_type: xfs

{{ volume["name"] }}-brick-{{ brick["name"] }}-mounted:
  mount.mounted:
    - name: /data/glusterfs/{{ volume["name"] }}/{{ brick["name"] }}
    - device: {{ brick["device"] }}
    - fstype: xfs
    - mkmnt: True
    - opts: {{ brick["mount_options"] }}
    - persist: True

{% endfor %}
{% endfor %}