curl:
  pkg.installed
zsh:
  pkg.installed

{% for user in ['root'] + pillar['users'] %}

'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"':
  cmd.run:
    - creates: '/home/{{user}}/.zshrc'
    - runas: {{user}}
    - require:
      - pkg: curl
      - pkg: zsh
chsh-zsh:
  user.present:
    - name: {{user}}
    - shell: /usr/bin/zsh
{% endfor %}