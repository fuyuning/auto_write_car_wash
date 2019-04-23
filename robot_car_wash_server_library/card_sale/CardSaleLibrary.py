from robot_car_wash_server_library.common import CommonLibrary


class CardSaleLibrary(CommonLibrary):
    def post_admin_card_sales(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/card_sales".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("card_id", "enabled", "order_by"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_card_sales(self):
        url = "{SERVER_DOMAIN}/admin/card_sales".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_admin_card_sales_by_card_sale_id(self, card_sale_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/card_sales/{card_sale_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, card_sale_id=card_sale_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("card_id", "enabled", "order_by"):
                data[k] = v
        return self.client.put(url, json=data)

    def delete_admin_card_sales_by_card_sale_id(self, card_sale_id):
        url = "{SERVER_DOMAIN}/admin/card_sales/{card_sale_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, card_sale_id=card_sale_id)
        return self.client.delete(url)

