*** Settings ***
Documentation  server_spot
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.spot.SpotLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:server_spot  


*** Test Cases ***
get projects cameras spots by project id camera id Success 
   [Documentation]  接口名:获取泊位${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Spot 对象。
   [Tags]           Respcode:200
   get projects cameras spots by project id camera id success 200     project_id=${project_id}  camera_id=${camera_id}

get projects cameras spots by project id camera id Fail With Wrong Url
   [Documentation]  接口名:获取泊位${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects cameras spots by project id camera id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}

put projects cameras spots by project id camera id spot id Success 
   [Documentation]  接口名:编辑泊位坐标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  draw_coordinate=${draw_coordinate}  
   ${unessential_params}  create dictionary  
   run every case by params   put projects cameras spots by project id camera id spot id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}  spot_id=${spot_id}

put projects cameras spots by project id camera id spot id Fail With Wrong Url
   [Documentation]  接口名:编辑泊位坐标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put projects cameras spots by project id camera id spot id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}  spot_id=${wrong_url_id}

put projects cameras spots by project id camera id spot id Fail With Wrong Params
   [Documentation]  接口名:编辑泊位坐标${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  draw_coordinate=${draw_coordinate_422}  
   ${unessential_params}  create dictionary  
   run every case by params   put projects cameras spots by project id camera id spot id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}  spot_id=${spot_id}  success=False


*** Variables ***
${project_id}  
${camera_id}  
${spot_id}  


*** Keywords ***
get projects cameras spots by project id camera id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras spots by project id camera id  &{kwargs}
   expect status is 200  ${resp}  server_spot/get_projects_cameras_spots_by_project_id_camera_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${spot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][spot_id]}
   set global variable   ${spot_id}

get projects cameras spots by project id camera id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras spots by project id camera id  &{kwargs}
   expect status is 404  ${resp}  

put projects cameras spots by project id camera id spot id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras spots by project id camera id spot id  &{kwargs}
   expect status is 204  ${resp}  

put projects cameras spots by project id camera id spot id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras spots by project id camera id spot id  &{kwargs}
   expect status is 404  ${resp}  

put projects cameras spots by project id camera id spot id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras spots by project id camera id spot id  &{kwargs}
   expect status is 422  ${resp}  

