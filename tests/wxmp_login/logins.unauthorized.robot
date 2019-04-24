*** Settings ***
Documentation  wxmp_login
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.login.LoginLibrary
Force Tags  model:wxmp_login  车主微信端


Post Login By Unionid Fail Without Login
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  unionid=${unionid}  
   ${unessential_params}  create list  
   run every case by params  Post Login By Unionid Fail 403  ${essential_params}  ${unessential_params}

Post Login By Openid Fail Without Login
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  client_id=${client_id}  secret=${secret}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post Login By Openid Fail 403  ${essential_params}  ${unessential_params}

Post Login By Unionid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Unionid   &{kwargs}
   expect status is 403  ${resp}  

Post Login By Openid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Login By Openid   &{kwargs}
   expect status is 403  ${resp}  

