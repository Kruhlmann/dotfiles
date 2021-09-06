import os


def get_pwd():
    home = os.path.expanduser("~")
    credentials_file_path = os.path.join(home, ".protonmail-cred")
    with open(credentials_file_path) as credentials_file:
        lines = credentials_file.read().splitlines()
        password = lines[1].replace("set my_pass=", "")
        return password
