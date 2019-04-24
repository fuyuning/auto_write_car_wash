from robot_car_wash_wxmp_library.common import CommonLibrary


class UserContactLibrary(CommonLibrary):
    def post_user_user_contacts(self, **kwargs):
        url = "{SERVER_DOMAIN}/user/user_contacts".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", "name", "car_type"):
                data[k] = v
        return self.client.post(url, json=data)

    def get_user_user_contacts_by_user_contact_id(self, user_contact_id):
        url = "{SERVER_DOMAIN}/user/user_contacts/{user_contact_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_contact_id=user_contact_id)
        return self.client.get(url)

    def get_user_user_contacts(self):
        url = "{SERVER_DOMAIN}/user/user_contacts".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        return self.client.get(url)

    def put_user_user_contacts_by_user_contact_id(self, user_contact_id, **kwargs):
        url = "{SERVER_DOMAIN}/user/user_contacts/{user_contact_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_contact_id=user_contact_id)
        data = {}
        for k, v in kwargs.items():
            if k in ("mobile", "name", "car_type"):
                data[k] = v
        return self.client.put(url, json=data)

    def put_is_default_by_user_contact_id(self, user_contact_id):
        url = "{SERVER_DOMAIN}/user/user_contacts/{user_contact_id}/is_default".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_contact_id=user_contact_id)
        return self.client.put(url)

    def delete_user_user_contacts_by_user_contact_id(self, user_contact_id):
        url = "{SERVER_DOMAIN}/user/user_contacts/{user_contact_id}".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN, user_contact_id=user_contact_id)
        return self.client.delete(url)

