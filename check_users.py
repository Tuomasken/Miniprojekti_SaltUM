import pwd

def audit_users(min_uid=1000, exclude=None):
    """
    Compare actual system users (UID >= min_uid) to users defined in pillar.

    Args:
        min_uid (int): Minimum UID to consider as a "real" user.
        exclude (list): List of usernames to ignore (e.g., 'nobody').

    Returns:
        dict: {
            expected: [users from pillar],
            actual: [users on system],
            missing: [users in pillar but not on system],
            extra: [users on system but not in pillar]
        }
    """
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
