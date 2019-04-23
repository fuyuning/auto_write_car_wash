from robot_car_wash_server_library.common import CommonLibrary


class LoginLibrary(CommonLibrary):
    def login(self, username, password, **kwargs):
        return super(LoginLibrary, self)._login(username, password)

    def logout(self):
        return super(LoginLibrary, self)._logout()
