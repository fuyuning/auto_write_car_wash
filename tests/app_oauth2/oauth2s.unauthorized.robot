*** Settings ***
Documentation  app_oauth2
Resource  ../resources.robot
Library  robot_washing_expert_library.oauth2.Oauth2Library
Force Tags  model:app_oauth2  虾客APP


*** Test Cases ***
post oauth 2.0 token Fail Without Login
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post oauth 2.0 token fail 403   grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  password=${Please_input}    userid=${userid}  mobile=${mobile}  

post oauth 2.0 token Fail Without Login
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post oauth 2.0 token fail 403   grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh}    

post car wash user reset password Fail Without Login
   [Documentation]  接口名:重置密码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash user reset password fail 403   mobile=${mobile}  new_pass=${Please_input}  captcha=${Please_input}  serie=${serie}    

put car wash user password Fail Without Login
   [Documentation]  接口名:修改密码${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put car wash user password fail 403   old_password=${old_password}  new_pass=${Please_input}    


*** Keywords ***
post oauth 2.0 token Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 403  ${resp}  

post oauth 2.0 token Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 403  ${resp}  

post car wash user reset password Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash user reset password  &{kwargs}
   expect status is 403  ${resp}  

put car wash user password Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put car wash user password  &{kwargs}
   expect status is 403  ${resp}  

