from robot_car_wash_server_library.common import CommonLibrary


class CouponPointLibrary(CommonLibrary):
    def patch_admin_coupon_point_autos_enable_by_coupon_point_auto_id(self, coupon_point_auto_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/coupon_point_autos/{coupon_point_auto_id}/enable".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_point_auto_id=coupon_point_auto_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("enable", ):
                data[k] = v
        return self.client.patch(url)

    def delete_admin_coupon_point_autos_by_coupon_point_auto_id(self, coupon_point_auto_id):
        url = "{SERVER_DOMAIN}/admin/coupon_point_autos/{coupon_point_auto_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, coupon_point_auto_id=coupon_point_auto_id)
        return self.client.delete(url)

