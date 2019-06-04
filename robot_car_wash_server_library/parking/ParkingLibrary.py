from robot_car_wash_server_library.common import CommonLibrary


class ParkingLibrary(CommonLibrary):
    def post_admin_parkings(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parkings".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("parking_name", "alias_name", "wash_area_id", "out_parking_id", "enabled", "lon", "lat", "parking_banners", "use_home_banner", "service_introduce", "address", "use_home_illustrate", "province", "city", "district", "position", "landing_content", "parking_map"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_parkings(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parkings".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("parking_name", "wash_area_id", "enabled", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_parkings_by_parking_id(self, parking_id):
        url = "{SERVER_DOMAIN}/admin/parkings/{parking_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, parking_id=parking_id)
        return self.client.get(url)

    def put_admin_parkings_by_parking_id(self, parking_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parkings/{parking_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, parking_id=parking_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("parking_name", "alias_name", "wash_area_id", "out_parking_id", "enabled", "lon", "lat", "parking_banners", "use_home_banner", "service_introduce", "address", "use_home_illustrate", "province", "city", "district", "position", "landing_content", "parking_map"):
                data[k] = v
        return self.client.put(url, json=data)

    def patch_admin_parkings_enabled_by_parking_id(self, parking_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parkings/{parking_id}/enabled".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, parking_id=parking_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", ):
                data[k] = v
        return self.client.patch(url, json=data)

    def delete_admin_parkings_by_parking_id(self, parking_id):
        url = "{SERVER_DOMAIN}/admin/parkings/{parking_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, parking_id=parking_id)
        return self.client.delete(url)

