*** Settings ***
Documentation  app_oauth2
Resource  ../resources.robot
Library  robot_car_wash_app_library.oauth2.Oauth2Library
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_oauth2  虾客APP


*** Test Cases ***
Post 2.0 Token Success 
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  userid=${userid}  password=${Please_input}  
   ${unessential_params}  create list  
   run every case by params  Post 2.0 Token Success 200  ${essential_params}  ${unessential_params}

Post 2.0 Token Fail With Wrong Params
   [Documentation]  接口名:账号密码授权${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  userid=${userid}  password=${Please_input}  
   ${unessential_params}  create list  
   run every case by params  Post 2.0 Token Fail 422  ${essential_params}  ${unessential_params}

Post 2.0 Token Success 
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh}  
   ${unessential_params}  create list  
   run every case by params  Post 2.0 Token Success 200  ${essential_params}  ${unessential_params}

Post 2.0 Token Fail With Wrong Params
   [Documentation]  接口名:刷新秘钥${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  grant_type=${grant_type}  client_id=${Please_input}  secret=${Please_input}  refresh=${refresh}  
   ${unessential_params}  create list  
   run every case by params  Post 2.0 Token Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post 2.0 Token Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post 2.0 Token   &{kwargs}
   expect status is 200  ${resp}  app_oauth2/Post_2.0_Token_200.json

Post 2.0 Token Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post 2.0 Token   &{kwargs}
   expect status is 422  ${resp}  

Post 2.0 Token Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post 2.0 Token   &{kwargs}
   expect status is 200  ${resp}  app_oauth2/Post_2.0_Token_200.json

Post 2.0 Token Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post 2.0 Token   &{kwargs}
   expect status is 422  ${resp}  

