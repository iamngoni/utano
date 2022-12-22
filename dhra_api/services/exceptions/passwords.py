class PasswordUsedException(Exception):
    def __init__(self, *args, **kwargs):
        self.args = args

    def __str__(self):
        return f"{self.args[0]}"
