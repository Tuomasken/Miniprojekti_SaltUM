{# Loop through each user in pillar['users'] #}
{% for user, info in pillar.get('users', {}).items() %}

{{ user }}_user:
  user.present:
    - name: {{ user }}
    - shell: {{ info.get('shell', '/bin/bash') }}
    - home: {{ info.get('home', '/home/' ~ user) }}
    - createhome: True

{{ user }}_ssh_dir:
  file.directory:
    - name: {{ info.get('home', '/home/' ~ user) }}/.ssh
    - user: {{ user }}
    - group: {{ user }}
    - mode: 700

{{ user }}_authorized_keys:
  file.managed:
    - name: {{ info.get('home', '/home/' ~ user) }}/.ssh/authorized_keys
    - user: {{ user }}
    - group: {{ user }}
    - mode: 600
    - contents: |
        {{ info['ssh_key'] }}

{% endfor %}
