*** Settings ***
Documentation  wxmp_login
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.login.LoginLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_login  车主微信端


*** Test Cases ***
Post Userinfo Decrypt Success 
   [Documentation]  接口名:小程序解密数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 https://developers.weixin.qq.com/miniprogram/dev/api/wx.getUserInfo.html 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  nickName=${nickName}  avatarUrl=${avatarUrl}  code=${code}  rawData=${rawData}  signature=${signature}  encryptedData=${encryptedData}  iv=${iv}  
   ${unessential_params}  create list  
   run every case by params  Post Userinfo Decrypt Success 200  ${essential_params}  ${unessential_params}

Post Userinfo Decrypt Fail With Wrong Params
   [Documentation]  接口名:小程序解密数据${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  nickName=${nickName}  avatarUrl=${avatarUrl}  code=${code}  rawData=${rawData}  signature=${signature}  encryptedData=${encryptedData}  iv=${iv}  
   ${unessential_params}  create list  
   run every case by params  Post Userinfo Decrypt Fail 422  ${essential_params}  ${unessential_params}

Post Login By Unionid Success 
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Post Login By Unionid Success 200  ${essential_params}  ${unessential_params}

Post Login By Unionid Fail With Wrong Params
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Post Login By Unionid Fail 422  ${essential_params}  ${unessential_params}

Post Login By Openid Success 
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post Login By Openid Success 200  ${essential_params}  ${unessential_params}

Post Login By Openid Fail With Wrong Params
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post Login By Openid Fail 422  ${essential_params}  ${unessential_params}

Post Login By Mobile Success 
   [Documentation]  接口名:手机号验证码注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  openid=${openid}  union_id=${union_id}  mn_open_id=${mn_open_id}  
   run every case by params  Post Login By Mobile Success 200  ${essential_params}  ${unessential_params}

Post Login By Mobile Fail With Wrong Params
   [Documentation]  接口名:手机号验证码注册${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  mobile=${mobile}  serie=${serie}  captcha=${captcha}  
   ${unessential_params}  create list  openid=${openid}  union_id=${union_id}  mn_open_id=${mn_open_id}  
   run every case by params  Post Login By Mobile Fail 422  ${essential_params}  ${unessential_params}

Get Openid By Tokenid Success 
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  tokenid=${tokenid}  
   ${unessential_params}  create list  
   run every case by params  Get Openid By Tokenid Success 200  ${essential_params}  ${unessential_params}

Get Openid By Tokenid Fail With Wrong Url
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  tokenid=${tokenid}  
   ${unessential_params}  create list  
   run every case by params  Get Openid By Tokenid Fail 404  ${essential_params}  ${unessential_params}

Get Openid By Tokenid Fail With Wrong Params
   [Documentation]  接口名:通过tokenid获取openid${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  tokenid=${tokenid}  
   ${unessential_params}  create list  
   run every case by params  Get Openid By Tokenid Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Userinfo Decrypt Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Userinfo Decrypt   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Userinfo_Decrypt_200.json

Post Userinfo Decrypt Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Userinfo Decrypt   &{kwargs}
   expect status is 422  ${resp}  

Post Login By Unionid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Unionid   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Login_By_Unionid_200.json

Post Login By Unionid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Unionid   &{kwargs}
   expect status is 422  ${resp}  

Post Login By Openid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Openid   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Login_By_Openid_200.json

Post Login By Openid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Openid   &{kwargs}
   expect status is 422  ${resp}  

Post Login By Mobile Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Mobile   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Post_Login_By_Mobile_200.json

Post Login By Mobile Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Mobile   &{kwargs}
   expect status is 422  ${resp}  

Get Openid By Tokenid Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Openid By Tokenid   &{kwargs}
   expect status is 200  ${resp}  wxmp_login/Get_Openid_By_Tokenid_200.json

Get Openid By Tokenid Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Openid By Tokenid   &{kwargs}
   expect status is 404  ${resp}  

Get Openid By Tokenid Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Openid By Tokenid   &{kwargs}
   expect status is 422  ${resp}  

