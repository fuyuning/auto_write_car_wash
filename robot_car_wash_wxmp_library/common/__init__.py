import requests

from robot.errors import VariableError
from robot.running import EXECUTION_CONTEXTS
import base64


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
        self.AUTH_CLIENT_ID = self.get_variable('${AUTH_CLIENT_ID}')
        self.AUTH_CLIENT_SECRET = self.get_variable('${AUTH_CLIENT_SECRET}')
        self.UU_CLIENT_ID = self.get_variable('${UU_CLIENT_ID}')
        self.UU_SECRET = self.get_variable('${UU_SECRET}')
        super(CommonLibrary, self).__init__()

    def login_by_openid(self, openid):
        global access_token
        global refresh_token
        print(openid)
        data = {
            'client_id': self.UU_CLIENT_ID,
            'secret': self.UU_SECRET,
            'openid': openid,
        }
        url = "{SERVER_DOMAIN}/login_by_openid".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.post(url, data=data)
        print(resp.status_code)
        if resp.status_code == 200:
            access_token = resp.json()["access_token"]
            print(access_token)
            resp = self.get_auth_token(access_token)
            access_token = resp.json()["access_token"]
            print(access_token)
            self.client.headers.update({
                "Authorization": "token "+access_token,
            })
        return resp

    def get_auth_token(self, uu_token):
        data = {
            'grant_type': 'uu_token',
            'client_id': self.AUTH_CLIENT_ID,
            'client_secret': self.AUTH_CLIENT_SECRET,
            'token': uu_token,
        }
        url = "https://auth-d.parkone.cn/oauth/2.0/token"
        resp = self.client.post(url, data=data)
        return resp

    def login_by_mobile(self, openid, mobile, captcha):
        global access_token
        global refresh_token
        index = self.send_login_mobile_captcha(mobile)
        serie = index.json()['serie']
        print("serie:"+serie)
        data = {
            'client_id': self.UU_CLIENT_ID,
            'secret': self.UU_SECRET,
            'mobile': mobile,
            'serie': serie,
            'captcha': captcha,
            'openid': openid
        }
        url = "{SERVER_DOMAIN}/login_by_mobile".format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.post(url, data=data)
        if resp.status_code == 200:
            access_token = resp.json()["access_token"]
            refresh_token = resp.json()["refresh_token"]
            self.client.headers.update({
                "Authorization": "token "+access_token,
            })
        return resp

    def send_login_mobile_captcha(self, mobile):
        data = {"mobile": mobile}
        print(mobile)
        url = "http://passport-t.uucin.com/accounts/send_login_mobile_captcha"
        client_id = self.UU_CLIENT_ID
        client_id = bytes(client_id, encoding='utf-8')
        x_clinent_id = base64.urlsafe_b64encode(client_id)
        x_clinent_id = str(x_clinent_id, encoding='utf-8')
        self.client.headers.update({"X-CLIENT-ID": x_clinent_id})
        resp = self.client.post(url, data=data)
        print("captcha:"+str(resp.json()))
        return resp

    def get_openid(self, token):
        data = {
            'tokenid': token
        }
        url = '{SERVER_DOMAIN}/openid_by_tokenid'.format(
            SERVER_DOMAIN=self.SERVER_DOMAIN)
        resp = self.client.get(url, params=data)
        return resp
