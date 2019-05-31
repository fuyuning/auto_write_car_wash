*** Settings ***
Documentation  server_spot
Resource  ../resources.robot
Library  robot_camera_monitor_server_library.spot.SpotLibrary
Force Tags  model:server_spot  


*** Test Cases ***
get projects cameras spots by project id camera id Fail Without Login
   [Documentation]  接口名:获取泊位${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects cameras spots by project id camera id fail 403     project_id=${project_id}  camera_id=${camera_id}

put projects cameras spots by project id camera id spot id Fail Without Login
   [Documentation]  接口名:编辑泊位坐标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put projects cameras spots by project id camera id spot id fail 403     project_id=${project_id}  camera_id=${camera_id}  spot_id=${spot_id}  draw_coordinate=${draw_coordinate}    


*** Variables ***
${project_id}  1a2b3c4d5e6f7zz
${camera_id}  1a2b3c4d5e6f7zz
${spot_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get projects cameras spots by project id camera id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras spots by project id camera id  &{kwargs}
   expect status is 403  ${resp}  

put projects cameras spots by project id camera id spot id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras spots by project id camera id spot id  &{kwargs}
   expect status is 403  ${resp}  

