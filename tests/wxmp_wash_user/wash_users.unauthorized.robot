*** Settings ***
Documentation  wxmp_wash_user
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_user.WashUserLibrary
Force Tags  model:wxmp_wash_user  车主微信端


*** Test Cases ***
post user user forms Fail Without Login
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  formid=${formid}  
   ${unessential_params}  create list  
   run every case by params  post user user forms Fail 403  ${essential_params}  ${unessential_params}

get user user info Fail Without Login
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  get user user info Fail 403  ${essential_params}  ${unessential_params}

put user user info Fail Without Login
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  put user user info Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
post user user forms Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user user forms  &{kwargs}
   expect status is 403  ${resp}  

get user user info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user user info  &{kwargs}
   expect status is 403  ${resp}  

put user user info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put user user info  &{kwargs}
   expect status is 403  ${resp}  

