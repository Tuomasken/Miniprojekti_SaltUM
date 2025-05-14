
{% set expected_users = pillar.get('users', {}).keys() | list %}

{% set current_users = salt['cmd.run']("awk -F: '$3 >= 1000 {print $1}' /etc/passwd").split('\n') %}
{% set ignored_users = ['nobody', 'vagrant'] %}
{% set users_to_remove = current_users | difference(expected_users + ignored_users) %}

{% for user in users_to_remove %}
remove_unexpected_user_{{ user }}:
  user.absent:
    - name: {{ user }}
    - purge: True
{% endfor %}
