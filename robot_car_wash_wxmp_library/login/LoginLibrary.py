from robot_car_wash_wxmp_library.common import CommonLibrary


class LoginLibrary(CommonLibrary):
    def send_login_mobile_captcha(self, mobile):
        return super(LoginLibrary, self).send_login_mobile_captcha(mobile)

    def login_by_mobile(self, openid, mobile, captcha):
        return super(LoginLibrary, self).login_by_mobile(openid, mobile, captcha)

    def login_by_openid(self, openid):
        return super(LoginLibrary, self).login_by_openid(openid)
