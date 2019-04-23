*** Settings ***
Documentation  wxmp_login
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.login.LoginLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_login  车主微信端


*** Test Cases ***
Post login Success 
   [Documentation]  接口名:小程序解密数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 https://developers.weixin.qq.com/miniprogram/dev/api/wx.getUserInfo.html 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  nickName=${nickName}  avatarUrl=${avatarUrl}  code=${code}  rawData=${rawData}  signature=${signature}  encryptedData=${encryptedData}  iv=${iv}  
   ${unessential_params}  create list  
   run every case by params  Post userinfo decrypt Success 200  ${essential_params}  ${unessential_params}



Post login Fail With Wrong Params
   [Documentation]  接口名:小程序解密数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  nickName=${nickName}  avatarUrl=${avatarUrl}  code=${code}  rawData=${rawData}  signature=${signature}  encryptedData=${encryptedData}  iv=${iv}  
   ${unessential_params}  create list  
   run every case by params  Post userinfo decrypt Fail 422  ${essential_params}  ${unessential_params}



Post login Fail Without Login
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Post login by unionid Fail 403  ${essential_params}  ${unessential_params}



Post login Success 
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Post login by unionid Success 200  ${essential_params}  ${unessential_params}



Post login Fail With Wrong Params
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Post login by unionid Fail 422  ${essential_params}  ${unessential_params}



Post login Fail Without Login
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post login by openid Fail 403  ${essential_params}  ${unessential_params}



Post login Success 
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post login by openid Success 200  ${essential_params}  ${unessential_params}



Post login Fail With Wrong Params
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post login by openid Fail 422  ${essential_params}  ${unessential_params}



Post login Success 
   [Documentation]  接口名:手机号验证码注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  openid=${openid}  union_id=${union_id}  mn_open_id=${mn_open_id}  
   run every case by params  Post login by mobile Success 200  ${essential_params}  ${unessential_params}



Post login Fail With Wrong Params
   [Documentation]  接口名:手机号验证码注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  openid=${openid}  union_id=${union_id}  mn_open_id=${mn_open_id}  
   run every case by params  Post login by mobile Fail 422  ${essential_params}  ${unessential_params}



Get login Success 
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  tokenid=${tokenid}  
   ${unessential_params}  create list  
   run every case by params  Get openid by tokenid Success 200  ${essential_params}  ${unessential_params}



Get login Fail With Wrong Url
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  tokenid=${tokenid}  
   ${unessential_params}  create list  
   run every case by params  Get openid by tokenid Fail 404  ${essential_params}  ${unessential_params}



Get login Fail With Wrong Params
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  tokenid=${tokenid}  
   ${unessential_params}  create list  
   run every case by params  Get openid by tokenid Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Post Userinfo decrypt Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post userinfo decrypt   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Userinfo_decrypt_200.json

Post Userinfo decrypt Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post userinfo decrypt   &{kwargs}
   expect status is 422  ${resp}  

Post Login by unionid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post login by unionid   &{kwargs}
   expect status is 403  ${resp}  

Post Login by unionid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post login by unionid   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Login_by_unionid_200.json

Post Login by unionid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login by unionid   &{kwargs}
   expect status is 422  ${resp}  

Post Login by openid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post login by openid   &{kwargs}
   expect status is 403  ${resp}  

Post Login by openid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post login by openid   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Login_by_openid_200.json

Post Login by openid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login by openid   &{kwargs}
   expect status is 422  ${resp}  

Post Login by mobile Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post login by mobile   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Login_by_mobile_200.json

Post Login by mobile Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login by mobile   &{kwargs}
   expect status is 422  ${resp}  

Get Openid by tokenid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get openid by tokenid   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Get_Openid_by_tokenid_200.json

Get Openid by tokenid Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get openid by tokenid   &{kwargs}
   expect status is 404  ${resp}  

Get Openid by tokenid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get openid by tokenid   &{kwargs}
   expect status is 422  ${resp}  

