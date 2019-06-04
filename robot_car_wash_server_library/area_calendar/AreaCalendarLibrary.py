from robot_car_wash_server_library.common import CommonLibrary


class AreaCalendarLibrary(CommonLibrary):
    def post_admin_area_calendars(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/area_calendars".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_area_id", "calendar"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_admin_area_calendars(self, **kwargs):
        url = "{SERVER_DOMAIN}/admin/area_calendars".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("wash_area_id", "month", "year"):
                data[k] = v
        return self.client.get(url, params=data)

    def delete_admin_area_calendars_by_area_calendar_id(self, area_calendar_id):
        url = "{SERVER_DOMAIN}/admin/area_calendars/{area_calendar_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, area_calendar_id=area_calendar_id)
        return self.client.delete(url)

