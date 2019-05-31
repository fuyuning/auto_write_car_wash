*** Settings ***
Documentation  server_camera
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.camera.CameraLibrary
Force Tags  model:server_camera  


*** Test Cases ***
get projects cameras by project id Fail Without Login
   [Documentation]  接口名:获取相机列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects cameras by project id fail 403     project_id=${project_id}

get projects cameras images by project id camera id Fail Without Login
   [Documentation]  接口名:获取电子泊位列表图片/相机详情图片${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects cameras images by project id camera id fail 403     project_id=${project_id}  camera_id=${camera_id}

get projects cameras by project id camera id Fail Without Login
   [Documentation]  接口名:获取相机详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects cameras by project id camera id fail 403     project_id=${project_id}  camera_id=${camera_id}

get projects camera brands by project id Fail Without Login
   [Documentation]  接口名:获取相机品牌${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects camera brands by project id fail 403     project_id=${project_id}

get projects camera brands camera models by project id camera brand id Fail Without Login
   [Documentation]  接口名:获取相机型号列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects camera brands camera models by project id camera brand id fail 403     project_id=${project_id}  camera_brand_id=${camera_brand_id}

put projects cameras by project id camera id Fail Without Login
   [Documentation]  接口名:编辑单个相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put projects cameras by project id camera id fail 403     project_id=${project_id}  camera_id=${camera_id}

put projects cameras by project id Fail Without Login
   [Documentation]  接口名:编辑批量相机参数配置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put projects cameras by project id fail 403     project_id=${project_id}

patch projects cameras by project id camera id Fail Without Login
   [Documentation]  接口名:编辑单个相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch projects cameras by project id camera id fail 403     project_id=${project_id}  camera_id=${camera_id}

patch projects cameras by project id Fail Without Login
   [Documentation]  接口名:编辑批量相机工作状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch projects cameras by project id fail 403     project_id=${project_id}


*** Variables ***
${project_id}  1a2b3c4d5e6f7zz
${camera_id}  1a2b3c4d5e6f7zz
${camera_brand_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get projects cameras by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras by project id  &{kwargs}
   expect status is 403  ${resp}  

get projects cameras images by project id camera id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras images by project id camera id  &{kwargs}
   expect status is 403  ${resp}  

get projects cameras by project id camera id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras by project id camera id  &{kwargs}
   expect status is 403  ${resp}  

get projects camera brands by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera brands by project id  &{kwargs}
   expect status is 403  ${resp}  

get projects camera brands camera models by project id camera brand id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera brands camera models by project id camera brand id  &{kwargs}
   expect status is 403  ${resp}  

put projects cameras by project id camera id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id camera id  &{kwargs}
   expect status is 403  ${resp}  

put projects cameras by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put projects cameras by project id  &{kwargs}
   expect status is 403  ${resp}  

patch projects cameras by project id camera id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id camera id  &{kwargs}
   expect status is 403  ${resp}  

patch projects cameras by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch projects cameras by project id  &{kwargs}
   expect status is 403  ${resp}  

