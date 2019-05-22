*** Settings ***
Documentation  server_dot
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.dot.DotLibrary
Force Tags  model:server_dot  中杆后台


*** Test Cases ***
post projects dot datas by project id Fail Without Login
   [Documentation]  接口名:添加勘探记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  lon=${lon}  lat=${lat}  address=${address}  poling_type=${poling_type}  height=${height}  cross_arm_num=${cross_arm_num}  camera_infos=${camera_infos}
   ${unessential_params}  create dictionary  reuse_pole_photo=${reuse_pole_photo}  remark=${remark}
   run every case by params   post projects dot datas by project id fail 403   ${essential_params}  ${unessential_params}    project_id=${project_id}

get projects dot datas by project id Fail Without Login
   [Documentation]  接口名:获取勘探记录/中杆安装列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  address=${address_422}  status=${status_422}  section=${section}  lon=${lon}  lat=${lat}  radius=${radius}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}
   run every case by params   get projects dot datas by project id fail 403   ${essential_params}  ${unessential_params}    project_id=${project_id}

get projects dot datas by project id dot data id Fail Without Login
   [Documentation]  接口名:获取勘探记录/中杆安装详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects dot datas by project id dot data id fail 403     project_id=${project_id}  dot_data_id=${dot_data_id}

get projects dot datas camera infos by project id dot data id camera info id Fail Without Login
   [Documentation]  接口名:获取指定编号相机信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects dot datas camera infos by project id dot data id camera info id fail 403     project_id=${project_id}  dot_data_id=${dot_data_id}  camera_info_id=${camera_info_id}

get projects statistics by project id Fail Without Login
   [Documentation]  接口名:数据统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects statistics by project id fail 403     project_id=${project_id}

put projects dot datas by project id dot data id Fail Without Login
   [Documentation]  接口名:修改勘探记录${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  lon=${lon}  lat=${lat}  address=${address}  poling_form=${poling_form}  height=${height}  cross_arm_num=${cross_arm_num}  camera_infos=${camera_infos}
   ${unessential_params}  create dictionary  reuse_pole_photo=${reuse_pole_photo}  remark=${remark}
   run every case by params   put projects dot datas by project id dot data id fail 403   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}

put projects dot datas camera info by project id dot data id camera info id Fail Without Login
   [Documentation]  接口名:添加/修改相机信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  reg_code=${reg_code}  coordinate=${coordinate}
   ${unessential_params}  create dictionary
   run every case by params   put projects dot datas camera info by project id dot data id camera info id fail 403   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}  camera_info_id=${camera_info_id}

patch projects dot datas status by project id dot data id Fail Without Login
   [Documentation]  接口名:变更中杆实施记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create dictionary  status=${status}
   ${unessential_params}  create dictionary
   run every case by params   patch projects dot datas status by project id dot data id fail 403   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}

delete projects dot datas by project id dot data id Fail Without Login
   [Documentation]  接口名:删除勘探记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete projects dot datas by project id dot data id fail 403     project_id=${project_id}  dot_data_id=${dot_data_id}


*** Variables ***
${project_id}  1a2b3c4d5e6f7zz
${dot_data_id}  1a2b3c4d5e6f7zz
${camera_info_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post projects dot datas by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post projects dot datas by project id  &{kwargs}
   expect status is 403  ${resp}

get projects dot datas by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas by project id  &{kwargs}
   expect status is 403  ${resp}

get projects dot datas by project id dot data id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas by project id dot data id  &{kwargs}
   expect status is 403  ${resp}

get projects camera infos by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera infos by project id  &{kwargs}
   expect status is 403  ${resp}

get projects dot datas camera infos by project id dot data id camera info id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas camera infos by project id dot data id camera info id  &{kwargs}
   expect status is 403  ${resp}

get projects statistics by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects statistics by project id  &{kwargs}
   expect status is 403  ${resp}

put projects dot datas by project id dot data id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas by project id dot data id  &{kwargs}
   expect status is 403  ${resp}

put projects dot datas camera info by project id dot data id camera info id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas camera infos by project id dot data id camera info id  &{kwargs}
   expect status is 403  ${resp}

patch projects dot datas status by project id dot data id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch projects dot datas status by project id dot data id  &{kwargs}
   expect status is 403  ${resp}

delete projects dot datas by project id dot data id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete projects dot datas by project id dot data id  &{kwargs}
   expect status is 403  ${resp}  

