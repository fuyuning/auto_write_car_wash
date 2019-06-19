from robot_car_wash_server_library.common import CommonLibrary


class InspectionLibrary(CommonLibrary):
    def post_admin_inspections(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/inspections".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "order_no", "inspection_time", "score", "inspector", "images"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_inspections(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/inspections".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def get_admin_inspections_by_inspection_id(self, inspection_id):
        url = "{SERVER_DOMAIN}/admin/inspections/{inspection_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, inspection_id=inspection_id)
        return self.client.get(url)

    def put_admin_inspections_by_inspection_id(self, inspection_id, **kwargs):
        url = "{SERVER_DOMAIN}/admin/inspections/{inspection_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, inspection_id=inspection_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("username", "order_no", "inspection_time", "score", "inspector", "images"):
                data[k] = v
        return self.client.put(url, json=data)

