*** Settings ***
Documentation  wxmp_wash_user
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_user.WashUserLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_wash_user  车主微信端


*** Test Cases ***
Post wash_user Success 
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  formid=${formid}  
   ${unessential_params}  create list  
   run every case by params  Post user user forms Success 201  ${essential_params}  ${unessential_params}



Post wash_user Fail Without Login
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  formid=${formid}  
   ${unessential_params}  create list  
   run every case by params  Post user user forms Fail 403  ${essential_params}  ${unessential_params}



Post wash_user Fail With Wrong Params
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  formid=${formid}  
   ${unessential_params}  create list  
   run every case by params  Post user user forms Fail 422  ${essential_params}  ${unessential_params}



Get wash_user Success 
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUser 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Get user user info Success 200  ${essential_params}  ${unessential_params}



Get wash_user Fail Without Login
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Get user user info Fail 403  ${essential_params}  ${unessential_params}



Get wash_user Fail With Wrong Params
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Get user user info Fail 422  ${essential_params}  ${unessential_params}



Put wash_user Success 
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Put user user info Success 204  ${essential_params}  ${unessential_params}



Put wash_user Fail Without Login
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Put user user info Fail 403  ${essential_params}  ${unessential_params}



Put wash_user Fail With Wrong Params
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Put user user info Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Post User user forms Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user user forms   &{kwargs}
   expect status is 201  ${resp}  wxmp_wash_user/Post_User_user_forms_201.json

Post User user forms Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user user forms   &{kwargs}
   expect status is 403  ${resp}  

Post User user forms Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user user forms   &{kwargs}
   expect status is 422  ${resp}  

Get User user info Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user user info   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_user/Get_User_user_info_200.json

Get User user info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user user info   &{kwargs}
   expect status is 403  ${resp}  

Get User user info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user user info   &{kwargs}
   expect status is 422  ${resp}  

Put User user info Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put user user info   &{kwargs}
   expect status is 204  ${resp}  

Put User user info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put user user info   &{kwargs}
   expect status is 403  ${resp}  

Put User user info Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put user user info   &{kwargs}
   expect status is 422  ${resp}  

