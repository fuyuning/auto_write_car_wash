*** Settings ***
Documentation  wxmp_wash_user
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_user.WashUserLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_wash_user  车主微信端


*** Test Cases ***
post user user forms Success 
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  formid=${formid}  
   ${unessential_params}  create dictionary  
   run every case by params   post user user forms success 204   ${essential_params}  ${unessential_params}

post user user forms Fail With Wrong Params
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  formid=${formid_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post user user forms fail 422   ${essential_params}  ${unessential_params}  success=False

get user user info Success 
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUser 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  unionid=${unionid}  
   ${unessential_params}  create dictionary  
   run every case by params   get user user info success 200   ${essential_params}  ${unessential_params}

get user user info Fail With Wrong Params
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  unionid=${unionid_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get user user info fail 422   ${essential_params}  ${unessential_params}  success=False

put user user info Success 
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create dictionary  
   run every case by params   put user user info success 204   ${essential_params}  ${unessential_params}

put user user info Fail With Wrong Params
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wx_nickname=${wx_nickname_422}  wx_avatarurl=${wx_avatarurl_422}  unionid=${unionid_422}  mobile=${mobile_422}  
   ${unessential_params}  create dictionary  
   run every case by params   put user user info fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post user user forms Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post user user forms  &{kwargs}
   expect status is 204  ${resp}  

post user user forms Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user user forms  &{kwargs}
   expect status is 422  ${resp}  

get user user info Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user user info  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_user/get_user_user_info_200.json

get user user info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user user info  &{kwargs}
   expect status is 422  ${resp}  

put user user info Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put user user info  &{kwargs}
   expect status is 204  ${resp}  

put user user info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put user user info  &{kwargs}
   expect status is 422  ${resp}  

