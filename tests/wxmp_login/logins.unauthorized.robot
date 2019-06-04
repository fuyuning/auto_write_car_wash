*** Settings ***
Documentation  wxmp_login
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.login.LoginLibrary
Force Tags  model:wxmp_login  车主微信端


*** Test Cases ***
post logout Fail Without Login
   [Documentation]  接口名:登出${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    post logout fail 403

post login by unionid Fail Without Login
   [Documentation]  接口名:unionid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post login by unionid fail 403   client_id=${client_id}  secret=${secret}  unionid=${unionid}    

post login by openid Fail Without Login
   [Documentation]  接口名:openid登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post login by openid fail 403   client_id=${client_id}  secret=${secret}  openid=${openid}    


*** Keywords ***
post logout Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post logout  &{kwargs}
   expect status is 403  ${resp}  

post login by unionid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post login by unionid  &{kwargs}
   expect status is 403  ${resp}  

post login by openid Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post login by openid  &{kwargs}
   expect status is 403  ${resp}  

