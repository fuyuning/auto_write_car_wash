import requests
import time

from robot.api import logger
from robot.errors import VariableError
from robot.running import EXECUTION_CONTEXTS

from robot_car_wash_server_library.utils.captcha import CaptchaOCR


class _CommonLibrary(object):
    def __init__(self):
        super(_CommonLibrary, self).__init__()

    @property
    def ctx(self):
        return EXECUTION_CONTEXTS.current

    @property
    def client(self):
        if hasattr(self.ctx, 'client'):
            return getattr(self.ctx, 'client')
        else:
            client = requests.session()
            setattr(self.ctx, 'client', client)
            return client

    @property
    def variables(self):
        return self.ctx.variables

    def get_variable(self, name, default=None):
        try:
            return self.variables[name]
        except VariableError:
            return default


class CommonLibrary(_CommonLibrary):
    def __init__(self):
        self.SERVER_DOMAIN = self.get_variable('${SERVER_DOMAIN}')
        super(CommonLibrary, self).__init__()

    def user(self):
        resp = self._get_user()
        if resp.status_code == 200:
            return resp.json()
        else:
            return None

    def is_login(self):
        return self.user() is not None

    def get_verify_code(self, vk, num=4):
        params = {
            'num': num,
            'vk': vk,
        }
        url = "{SERVER_DOMAIN}/admin/get_verify_code".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.get(url, params=params)
        verify_code = CaptchaOCR(resp.content).verify_code
        while len(verify_code) != 4:
            verify_code = self.get_verify_code(vk, num)
        return verify_code

    def _login(self, username, password):
        verify_key = int(time.time())
        verify_code = self.get_verify_code(verify_key)
        data = {
            'username': username,
            'password': password,
            'verify_key': verify_key,
            'verify_code': verify_code,
        }
        url = "{SERVER_DOMAIN}/admin/login".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.post(url, data=data)
        return resp

    def _logout(self):
        url = "{SERVER_DOMAIN}/admin/logout".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.post(url)
        return resp

    def _get_user(self):
        url = "{SERVER_DOMAIN}/admin/user".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.get(url)
        return resp

    def login(self, username, password, force=False):
        if force or not self.is_login():
            while True:
                resp = self._login(username, password)
                if resp.status_code == 204:
                    break
                if resp.status_code == 422 \
                        and 'verify_code' in resp.content.decode():
                    logger.info(resp.json())
                    continue
                else:
                    break

    def logout(self):
        self._logout()
