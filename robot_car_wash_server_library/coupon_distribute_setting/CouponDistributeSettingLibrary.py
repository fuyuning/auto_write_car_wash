from robot_car_wash_server_library.common import CommonLibrary


class CouponDistributeSettingLibrary(CommonLibrary):
    def post_admin_coupon_distribute_settings(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_distribute_settings".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("category", "coupon_pool_id", "enabled", "order_by"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_coupon_distribute_settings(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_distribute_settings".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("category", ):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_coupon_distribute_settings_(invite_register|invite_first)(self):
        url = "{SERVER_DOMAIN}/admin/coupon_distribute_settings/(invite_register|invite_first)".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_coupon_distribute_settings_by_setting_id(self, setting_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_distribute_settings/{setting_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, setting_id=setting_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("enabled", "coupon_pool_id"):
                data[k] = v
        return self.client.put(url, json=data)

    def put_admin_coupon_distribute_settings_(invite_register|invite_first|new_user)(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_distribute_settings/(invite_register|invite_first|new_user)".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("coupon_pool_id", "enabled"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_coupon_distribute_settings_by_setting_id(self, setting_id):
        url = "{SERVER_DOMAIN}/admin/coupon_distribute_settings/{setting_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, setting_id=setting_id)
        return self.client.delete(url)

