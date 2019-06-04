*** Settings ***
Documentation  wxmp_login
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.login.LoginLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_login  车主微信端


*** Test Cases ***
post logout Success 
   [Documentation]  接口名:登出${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
    post logout success 204

post login mobile Success 
   [Documentation]  接口名:手机号注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  client_id=${client_id}  secret=${secret}  mobile=${mobile}  union_id=${union_id}  mn_open_id=${mn_open_id}  sign=${sign}  
   ${unessential_params}  create dictionary  
   run every case by params   post login mobile success 200   ${essential_params}  ${unessential_params}

post login mobile Fail With Wrong Params
   [Documentation]  接口名:手机号注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  client_id=${client_id_422}  secret=${secret_422}  mobile=${mobile_422}  union_id=${union_id_422}  mn_open_id=${mn_open_id_422}  sign=${sign_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post login mobile fail 422   ${essential_params}  ${unessential_params}  success=False

post wechat userinfo decrypt Success 
   [Documentation]  接口名:小程序解密数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 https://developers.weixin.qq.com/miniprogram/dev/api/wx.getUserInfo.html 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  nickName=${nickName}  avatarUrl=${avatarUrl}  code=${code}  rawData=${rawData}  signature=${signature}  encryptedData=${encryptedData}  iv=${iv}  
   ${unessential_params}  create dictionary  
   run every case by params   post wechat userinfo decrypt success 200   ${essential_params}  ${unessential_params}

post wechat userinfo decrypt Fail With Wrong Params
   [Documentation]  接口名:小程序解密数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  nickName=${nickName_422}  avatarUrl=${avatarUrl_422}  code=${code_422}  rawData=${rawData_422}  signature=${signature_422}  encryptedData=${encryptedData_422}  iv=${iv_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post wechat userinfo decrypt fail 422   ${essential_params}  ${unessential_params}  success=False

post login by unionid Success 
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  client_id=${client_id}  secret=${secret}  unionid=${unionid}  
   ${unessential_params}  create dictionary  
   run every case by params   post login by unionid success 200   ${essential_params}  ${unessential_params}

post login by unionid Fail With Wrong Params
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  client_id=${client_id_422}  secret=${secret_422}  unionid=${unionid_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post login by unionid fail 422   ${essential_params}  ${unessential_params}  success=False

post login by openid Success 
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  client_id=${client_id}  secret=${secret}  openid=${openid}  
   ${unessential_params}  create dictionary  
   run every case by params   post login by openid success 200   ${essential_params}  ${unessential_params}

post login by openid Fail With Wrong Params
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  client_id=${client_id_422}  secret=${secret_422}  openid=${openid_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post login by openid fail 422   ${essential_params}  ${unessential_params}  success=False

post login by mobile Success 
   [Documentation]  接口名:手机号验证码注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  client_id=${client_id}  secret=${secret}  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create dictionary  openid=${openid}  union_id=${union_id}  mn_open_id=${mn_open_id}  
   run every case by params   post login by mobile success 200   ${essential_params}  ${unessential_params}

post login by mobile Fail With Wrong Params
   [Documentation]  接口名:手机号验证码注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  client_id=${client_id_422}  secret=${secret_422}  mobile=${mobile_422}  serie=${serie_422}  captcha=${captcha_422}  
   ${unessential_params}  create dictionary  openid=${openid_422}  union_id=${union_id_422}  mn_open_id=${mn_open_id_422}  
   run every case by params   post login by mobile fail 422   ${essential_params}  ${unessential_params}  success=False

get openid by tokenid Success 
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  tokenid=${tokenid}  
   ${unessential_params}  create dictionary  
   run every case by params   get openid by tokenid success 200   ${essential_params}  ${unessential_params}

get openid by tokenid Fail With Wrong Params
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  tokenid=${tokenid_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get openid by tokenid fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post logout Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post logout  &{kwargs}
   expect status is 204  ${resp}  

post login mobile Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post login mobile  &{kwargs}
   expect status is 200  ${resp}  wxmp_login/post_login_mobile_200.json

post login mobile Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login mobile  &{kwargs}
   expect status is 422  ${resp}  

post wechat userinfo decrypt Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post wechat userinfo decrypt  &{kwargs}
   expect status is 200  ${resp}  wxmp_login/post_wechat_userinfo_decrypt_200.json

post wechat userinfo decrypt Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post wechat userinfo decrypt  &{kwargs}
   expect status is 422  ${resp}  

post login by unionid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post login by unionid  &{kwargs}
   expect status is 200  ${resp}  wxmp_login/post_login_by_unionid_200.json

post login by unionid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login by unionid  &{kwargs}
   expect status is 422  ${resp}  

post login by openid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post login by openid  &{kwargs}
   expect status is 200  ${resp}  wxmp_login/post_login_by_openid_200.json

post login by openid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login by openid  &{kwargs}
   expect status is 422  ${resp}  

post login by mobile Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post login by mobile  &{kwargs}
   expect status is 200  ${resp}  wxmp_login/post_login_by_mobile_200.json

post login by mobile Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login by mobile  &{kwargs}
   expect status is 422  ${resp}  

get openid by tokenid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get openid by tokenid  &{kwargs}
   expect status is 200  ${resp}  wxmp_login/get_openid_by_tokenid_200.json

get openid by tokenid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get openid by tokenid  &{kwargs}
   expect status is 422  ${resp}  

