from robot_car_wash_wxmp_library.common import CommonLibrary


class WashNormalLibrary(CommonLibrary):
    def get_wash_normals(self, **kwargs):
        url = "{SERVER_DOMAIN}/wash_normals".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_area_id", ):
                data[k] = v
        return self.client.get(url, params=data)

