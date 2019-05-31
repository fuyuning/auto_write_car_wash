*** Settings ***
Documentation  server_user
Resource  ../resources.robot
Library  robot_camera_monitor_server_library.user.UserLibrary
Force Tags  model:server_user  


get user Fail Without Login
   [Documentation]  接口名:获取用户信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get user fail 403

get user Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user  &{kwargs}
   expect status is 403  ${resp}  

