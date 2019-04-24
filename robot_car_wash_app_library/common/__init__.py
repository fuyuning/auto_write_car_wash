import requests

from robot.errors import VariableError
from robot.running import EXECUTION_CONTEXTS


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
    refresh_token = 0
    access_token = 0

    def __init__(self):
        self.SERVER_DOMAIN = self.get_variable('${SERVER_DOMAIN}')
        self.CLIENT_ID = self.get_variable('${CLIENT_ID}')
        self.SECRET = self.get_variable('${SECRET}')
        super(CommonLibrary, self).__init__()

    def login(self, userid, password):
        global access_token
        global refresh_token
        data = {
            'grant_type': 'password',
            'client_id': self.CLIENT_ID,
            'secret': self.SECRET,
            'userid': userid,
            'password': password
        }
        url = "{SERVER_DOMAIN}/oauth/2.0/token".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.post(url, data=data)
        if resp.status_code == 200:
            access_token = resp.json()["access_token"]
            refresh_token = resp.json()["refresh_token"]
            self.client.headers.update({
                "Authorization": "token "+access_token,
            })
        return resp

    def refurbish(self):
        global access_token
        global refresh_token
        data = {
            'grant_type': 'refresh_token',
            'client_id': self.CLIENT_ID,
            'secret': self.SECRET,
            'refresh_token': refresh_token
        }
        url = '{SERVER_DOMAIN}/oauth/2.0/token'.format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.post(url, data=data)
        if resp.status_code == 200:
            access_token = resp.json()["access_token"]
            refresh_token = resp.json()["refresh_token"]
            self.client.headers.update({
                "Authorization": "token "+access_token,
            })
        return resp
