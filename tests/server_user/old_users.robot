*** Settings ***
Documentation  server_user
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.user.UserLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:server_user  


*** Test Cases ***
post login Success 
   [Documentation]  接口名:用户登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  username=${username}  password=${password}  
   ${unessential_params}  create dictionary  
   run every case by params   post login success 204   ${essential_params}  ${unessential_params}

post login Fail With Wrong Params
   [Documentation]  接口名:用户登录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  username=${username_422}  password=${password_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post login fail 422   ${essential_params}  ${unessential_params}  success=False

post logout Success 
   [Documentation]  接口名:用户退出${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
    post logout success 204

get user Success 
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 User 列表。
   [Tags]           Respcode:200
    get user success 200


*** Keywords ***
post login Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post login  &{kwargs}
   expect status is 204  ${resp}  

post login Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post login  &{kwargs}
   expect status is 422  ${resp}  

post logout Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post logout  &{kwargs}
   expect status is 204  ${resp}  

get user Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user  &{kwargs}
   expect status is 200  ${resp}  server_user/get_user_200.json

