{% for user in pillar['users'] %}
ssh-access-{{ user }}:
  ssh_auth.present:
    - name: {{ user }}.pub
    - user: {{ user }}
    - source: salt://ssh-keys/{{ user }}.pub
{% endfor %}
