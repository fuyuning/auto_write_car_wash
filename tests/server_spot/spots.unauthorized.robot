*** Settings ***
Documentation  server_spot
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.spot.SpotLibrary
Force Tags  model:server_spot  中杆后台


*** Test Cases ***
post projects spots import by project id Fail Without Login
   [Documentation]  接口名:导入泊位${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post projects spots import by project id fail 403     project_id=${project_id}  file=tests/server_spot/spot_info.xlsx

get projects spots by project id Fail Without Login
   [Documentation]  接口名:获取泊位列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  spot_num=${spot_num}  spot_type=${spot_type}  road_name=${road_name}  start_road=${start_road}  end_road=${end_road}  section=${section}  page_num=${page_num}  page_size=${page_size}
   run every case by params   get projects spots by project id fail 403   ${essential_params}  ${unessential_params}    project_id=${project_id}

delete projects spots by project id spot id Fail Without Login
   [Documentation]  接口名:删除单个泊位${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete projects spots by project id spot id fail 403     project_id=${project_id}  spot_id=${spot_id}

delete projects spots by project id Fail Without Login
   [Documentation]  接口名:删除所有泊位${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete projects spots by project id fail 403     project_id=${project_id}


*** Variables ***
${project_id}  1a2b3c4d5e6f7zz
${spot_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post projects spots import by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post projects spots import by project id  &{kwargs}
   expect status is 403  ${resp}  

get projects spots by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots by project id  &{kwargs}
   expect status is 403  ${resp}  

delete projects spots by project id spot id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete projects spots by project id spot id  &{kwargs}
   expect status is 403  ${resp}  

delete projects spots by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete projects spots by project id  &{kwargs}
   expect status is 403  ${resp}  

