from robot_car_wash_server_library.common import CommonLibrary


class UserLibrary(CommonLibrary):
    def get_user(self):
        return super(UserLibrary, self)._get_user()
