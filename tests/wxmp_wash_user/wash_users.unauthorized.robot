*** Settings ***
Documentation  wxmp_wash_user
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_user.WashUserLibrary
Force Tags  model:wxmp_wash_user  车主微信端


Post User User Forms Fail Without Login
   [Documentation]  接口名:上传forms${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  formid=${formid}  
   ${unessential_params}  create list  
   run every case by params  Post User User Forms Fail 403  ${essential_params}  ${unessential_params}

Get User User Info Fail Without Login
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Get User User Info Fail 403  ${essential_params}  ${unessential_params}

Put User User Info Fail Without Login
   [Documentation]  接口名:上传用户信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wx_nickname=${wx_nickname}  wx_avatarurl=${wx_avatarurl}  unionid=${unionid}  mobile=${mobile}  
   ${unessential_params}  create list  
   run every case by params  Put User User Info Fail 403  ${essential_params}  ${unessential_params}

Post User User Forms Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Forms   &{kwargs}
   expect status is 403  ${resp}  

Get User User Info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Info   &{kwargs}
   expect status is 403  ${resp}  

Put User User Info Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Info   &{kwargs}
   expect status is 403  ${resp}  

