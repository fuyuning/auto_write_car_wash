from robot_car_wash_server_library.common import CommonLibrary


class RobotLibrary(CommonLibrary):
    def post_admin_robots(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/robots".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", "name", "car_id"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_robots(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/robots".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", "car_id", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_cancel_by_robot_id(self, robot_id):
        url = "{SERVER_DOMAIN}/admin/robots/{robot_id}/cancel".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, robot_id=robot_id)
        return self.client.delete(url)

