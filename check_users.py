import pwd

def audit_users(min_uid=1000, exclude=None):

    if exclude is None:
        exclude = ['nobody', 'vagrant']

    expected_users = list(__pillar__.get('users', {}).keys())

    actual_users = [
        user.pw_name
        for user in pwd.getpwall()
        if user.pw_uid >= min_uid and user.pw_name not in exclude
    ]

    missing_users = sorted(set(expected_users) - set(actual_users))
    extra_users = sorted(set(actual_users) - set(expected_users))

    return {
        'expected': sorted(expected_users),
        'actual': sorted(actual_users),
        'missing': missing_users,
        'extra': extra_users,
    }
