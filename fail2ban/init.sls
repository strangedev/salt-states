/etc/fail2ban/jail.d/sshd.local:
  file.managed:
    - source: salt://fail2ban/jail.d/sshd.local
    - template: jinja

{% if 'apache' in pillar['fail2ban']['jails'] %}
/etc/fail2ban/jail.d/apache.local:
  file.managed:
    - source: salt://fail2ban/jail.d/apache.local
    - template: jinja
{% endif %}

{% if 'wordpress' in pillar['fail2ban']['jails'] %}
/etc/fail2ban/jail.d/wordpress.local:
  file.managed:
    - source: salt://fail2ban/jail.d/wordpress.local
    - template: jinja
/etc/fail2ban/filters.d/wordpress-hard.conf:
  file.managed:
    - source: salt://fail2ban/filters.d/wordpress-hard.conf
{% endif %}

fail2ban:
  pkg.installed: []
  service.running:
    - enable: True
    - reload: True
    - require:
      - pkg: fail2ban
      - file: /etc/fail2ban/jail.d/sshd.local
      {% if 'apache' in pillar['fail2ban']['jails'] %}
      - file: /etc/fail2ban/jail.d/apache.local
      {% endif %}
      {% if 'wordpress' in pillar['fail2ban']['jails'] %}
      - file: /etc/fail2ban/jail.d/apache.local
      - file: /etc/fail2ban/filters.d/wordpress-hard.conf
      {% endif %}
    - watch:
      - file: /etc/fail2ban/jail.d/*.local
      - file: /etc/fail2ban/filters.d/*.conf