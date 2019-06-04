from robot_car_wash_wxmp_library.common import CommonLibrary


class ServiceGroupLibrary(CommonLibrary):
    def get_user_service_groups_price_by_service_group_id(self, service_group_id, **kwargs):
        url = "{SERVER_DOMAIN}/user/service_groups/{service_group_id}/price".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, service_group_id=service_group_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_series_id", ):
                data[k] = v
        return self.client.get(url, params=data)

