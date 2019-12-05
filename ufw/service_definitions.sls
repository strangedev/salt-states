{% for service in pillar['ufw']['services'] %}
/etc/ufw/applications.d/{{ service }}.ini:
  file.managed:
    - source: salt://ufw/{{ service }}.ini
    - user: root
    - group: root
    - mode: 644
{% endfor %}