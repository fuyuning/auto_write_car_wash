from robot_car_wash_server_library.common import CommonLibrary


class SummonLibrary(CommonLibrary):
    def get_admin_summons(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/summons".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("name", "created_section", "page_num", "page_size"):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_admin_summons_by_summon_id(self, summon_id):
        url = "{SERVER_DOMAIN}/admin/summons/{summon_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, summon_id=summon_id)
        return self.client.delete(url)

