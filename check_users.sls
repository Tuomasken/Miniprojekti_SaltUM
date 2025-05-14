{% set all_users = salt['user.getent']() %}
{% set expected_users = pillar.get('users', {}).keys() %}
{% set system_users = [] %}

{# Filter real human users: UID >= 1000 and not 'nobody' #}
{% for user, attrs in all_users.items() %}
  {% if attrs.uid >= 1000 and user != 'nobody' %}
    {% do system_users.append(user) %}
  {% endif %}
{% endfor %}

{% set extra_users = system_users | difference(expected_users | list) %}

{# Optional: log or remove unexpected users #}
{% for user in extra_users %}
log_extra_user_{{ user }}:
  test.show_notification:
    - text: "User {{ user }} exists but is not defined in pillar. Consider removing."

{% endfor %}
