*** Settings ***
Documentation  server_project
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.project.ProjectLibrary
Force Tags  model:server_project  中杆后台


*** Test Cases ***
post projects Fail Without Login
   [Documentation]  接口名:添加项目${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  project_name=${project_name}  province=${province}  city=${city}  district=${district}  address=${address}  region_id=${region_id}  camera_brand_id=${camera_brand_id}
   ${unessential_params}  create dictionary  leader=${leader}  mobile=${mobile}     status=${status}
   run every case by params   post projects fail 403   ${essential_params}  ${unessential_params}

get projects Fail Without Login
   [Documentation]  接口名:获取项目列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  project_name=${project_name}  page_size=${page_size}  page_num=${page_num}   status=${status}
   run every case by params   get projects fail 403   ${essential_params}  ${unessential_params}

get projects equipment list export by project id Fail Without Login
   [Documentation]  接口名:导出设备清单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects equipment list export by project id fail 403     project_id=${project_id}

get projects export by project id Fail Without Login
   [Documentation]  接口名:导出项目文件${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects export by project id fail 403     project_id=${project_id}

get camera brands Fail Without Login
   [Documentation]  接口名:获取相机品牌信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get camera brands fail 403

put projects by project id Fail Without Login
   [Documentation]  接口名:修改项目${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  project_name=${project_name}  province=${province}  city=${city}  district=${district}  address=${address}  region_id=${region_id}  camera_brand_id=${camera_brand_id}
   ${unessential_params}  create dictionary  leader=${leader}  mobile=${mobile}    status=${status}
   run every case by params   put projects by project id fail 403   ${essential_params}  ${unessential_params}    project_id=${project_id}

delete projects by project id Fail Without Login
   [Documentation]  接口名:删除项目${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete projects by project id fail 403     project_id=${project_id}


*** Variables ***
${project_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post projects Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post projects  &{kwargs}
   expect status is 403  ${resp}

get projects Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects  &{kwargs}
   expect status is 403  ${resp}

get projects equipment list export by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects equipment list export by project id  &{kwargs}
   expect status is 403  ${resp}

get projects export by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects export by project id  &{kwargs}
   expect status is 403  ${resp}

get camera brands Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get camera brands  &{kwargs}
   expect status is 403  ${resp}

put projects by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put projects by project id  &{kwargs}
   expect status is 403  ${resp}

delete projects by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete projects by project id  &{kwargs}
   expect status is 403  ${resp}  

