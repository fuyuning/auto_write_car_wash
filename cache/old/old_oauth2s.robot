*** Settings ***
Documentation  app_oauth2
Resource  ../resources.robot
Library  robot_car_wash_app_library.oauth2.Oauth2Library
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_oauth2  虾客APP


*** Test Cases ***
post oauth 2.0 token Success 
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  userid=${userid}  password=${Please_input}  
   ${unessential_params}  create list  
   run every case by params  post oauth 2.0 token Success 200  ${essential_params}  ${unessential_params}

post oauth 2.0 token Fail With Wrong Params
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  grant_type=${grant_type_422}  client_id=${Please_input}  secret=${Please_input}  userid=${userid_422}  password=${Please_input}  
   ${unessential_params}  create list  
   run every case by params  post oauth 2.0 token Fail 422  ${essential_params}  ${unessential_params}  success=False

post oauth 2.0 token Success 
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh}  
   ${unessential_params}  create list  
   run every case by params  post oauth 2.0 token Success 200  ${essential_params}  ${unessential_params}

post oauth 2.0 token Fail With Wrong Params
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  grant_type=${grant_type_422}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh_422}  
   ${unessential_params}  create list  
   run every case by params  post oauth 2.0 token Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post oauth 2.0 token Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 200  ${resp}  app_oauth2/post_oauth_2.0_token_200.json

post oauth 2.0 token Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 422  ${resp}  

post oauth 2.0 token Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 200  ${resp}  app_oauth2/post_oauth_2.0_token_200.json

post oauth 2.0 token Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post oauth 2.0 token  &{kwargs}
   expect status is 422  ${resp}  

