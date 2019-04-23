from robot_car_wash_server_library.common import CommonLibrary


class ParkingCouponLibrary(CommonLibrary):
    def get_admin_parking_coupons(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/parking_coupons".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("car_id", "order_no", "car_washer", "parking_id", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_admin_parking_coupons_by_parking_coupon_id(self, parking_coupon_id):
        url = "{SERVER_DOMAIN}/admin/parking_coupons/{parking_coupon_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, parking_coupon_id=parking_coupon_id)
        return self.client.delete(url)

