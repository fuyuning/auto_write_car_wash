from robot_camera_monitor_deployment_server.common import CommonLibrary


class UserLibrary(CommonLibrary):
    def post_login(self, **kwargs):
        url = "{SERVER_DOMAIN}/login".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "password"):
                data[k] = v
        return self.client.post(url, json=data)

    def post_logout(self):
        url = "{SERVER_DOMAIN}/logout".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.post(url)

    def get_user(self):
        url = "{SERVER_DOMAIN}/user".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

