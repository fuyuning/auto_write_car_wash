*** Settings ***
Documentation  app_oauth2
Resource  ../resources.robot
Library  robot_car_wash_app_library.oauth2.Oauth2Library
Force Tags  model:app_oauth2  虾客APP


*** Test Cases ***
Post 2.0 Token Fail Without Login
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  userid=${userid}  password=${Please_input}  
   ${unessential_params}  create list  
   run every case by params  Post 2.0 Token Fail 403  ${essential_params}  ${unessential_params}

Post 2.0 Token Fail Without Login
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh}  
   ${unessential_params}  create list  
   run every case by params  Post 2.0 Token Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Post 2.0 Token Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post 2.0 Token   &{kwargs}
   expect status is 403  ${resp}  

Post 2.0 Token Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post 2.0 Token   &{kwargs}
   expect status is 403  ${resp}  

