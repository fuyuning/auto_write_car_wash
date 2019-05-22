*** Settings ***
Documentation  server_dot
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.dot.DotLibrary  WITH NAME  dot
Library  robot_camera_monitor_deployment_server.project.ProjectLibrary  WITH NAME  project
Suite Setup  dot.Login  ${admin_username}   ${admin_password}
Suite Teardown  dot.Logout
Force Tags  model:server_dot  中杆后台


*** Test Cases ***
post projects dot datas by project id Success
   [Documentation]  接口名:添加勘探记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   @{camera_infos}  make camera infos
   ${project_name}  make num
   ${project_name}  set variable  robot${project_name}
   ${resp}=  project.post_projects  project_name=${project_name}  province=${province}  city=${city}  district=${district}  address=${address}  region_id=${region_id}  camera_brand_id=${camera_brand_id}
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()['project_id']}
   set global variable   ${project_id}
   post projects dot datas by project id Success 201  lon=${lon}  lat=${lat}  address=${address}  poling_type=${poling_type}  height=${height}  cross_arm_num=${cross_arm_num}  camera_infos=@{camera_infos}  reuse_pole_photo=${reuse_pole_photo}  project_id=${project_id}
   @{camera_infos}  make camera infos
   post projects dot datas by project id Success 201  lon=${lon}  lat=${lat}  address=${address}  poling_type=${poling_type}  height=${height}  cross_arm_num=${cross_arm_num}  camera_infos=@{camera_infos}  remark=${remark}  project_id=${project_id}


post projects dot datas by project id Fail With Wrong Url
   [Documentation]  接口名:添加勘探记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  lon=${lon}  lat=${lat}  address=${address}  poling_type=${poling_type}  height=${height}  cross_arm_num=${cross_arm_num}  camera_infos=@{camera_infos}
   ${unessential_params}  create dictionary  reuse_pole_photo=${reuse_pole_photo}  remark=${remark}
   run every case by params   post projects dot datas by project id fail 404   ${essential_params}  ${unessential_params}    project_id=${wrong_url_id}

post projects dot datas by project id Fail With Wrong Params
   [Documentation]  接口名:添加勘探记录${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  lon=${lon_422}  lat=${lat_422}  address=${address_422}  poling_type=${poling_type_422}  height=${height_422}  cross_arm_num=${cross_arm_num_422}  camera_infos=${camera_infos_422}
   ${unessential_params}  create dictionary  reuse_pole_photo=${reuse_pole_photo_422}  remark=${remark_422}
   run every case by params   post projects dot datas by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

get projects dot datas by project id Fail With Wrong Url
   [Documentation]  接口名:获取勘探记录/中杆安装列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  status=${status}
   ${unessential_params}  create dictionary  address=${address}  section=${section}  lon=${lon}  lat=${lat}  radius=${radius}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}
   run every case by params   get projects dot datas by project id fail 404   ${essential_params}  ${unessential_params}    project_id=${wrong_url_id}

get projects dot datas by project id Success
   [Documentation]  接口名:获取勘探记录/中杆安装列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 DotData 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  status=${status}
   ${unessential_params}  create dictionary  address=${address}  section=${section}  lon=${lon}  lat=${lat}  radius=${radius}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}
   run every case by params   get projects dot datas by project id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}

get projects dot datas by project id Fail With Wrong Params
   [Documentation]  接口名:获取勘探记录/中杆安装列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  status=${status_422}
   ${unessential_params}  create dictionary  radius=${radius_422}  order_by=${order_by_422}  page_num=${page_num_422}  page_size=${page_size_422}
   run every case by params   get projects dot datas by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

get projects dot datas by project id dot data id Success
   [Documentation]  接口名:获取勘探记录/中杆安装详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 DotData 对象。
   [Tags]           Respcode:200
   get projects dot datas by project id dot data id success 200     project_id=${project_id}  dot_data_id=${dot_data_id}

get projects dot datas by project id dot data id Fail With Wrong Url
   [Documentation]  接口名:获取勘探记录/中杆安装详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects dot datas by project id dot data id fail 404     project_id=${wrong_url_id}  dot_data_id=${wrong_url_id}

get projects dot datas camera infos by project id dot data id camera info id Success
   [Documentation]  接口名:获取指定编号相机信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CameraInfo 对象。
   [Tags]           Respcode:200
   get projects dot datas camera infos by project id dot data id camera info id success 200     project_id=${project_id}  dot_data_id=${dot_data_id}  camera_info_id=${camera_info_id}

get projects dot datas camera infos by project id dot data id camera info id Fail With Wrong Url
   [Documentation]  接口名:获取指定编号相机信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects dot datas camera infos by project id dot data id camera info id fail 404     project_id=${wrong_url_id}  dot_data_id=${wrong_url_id}  camera_info_id=${wrong_url_id}

get projects statistics by project id Success
   [Documentation]  接口名:数据统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   get projects statistics by project id success 200     project_id=${project_id}

get projects statistics by project id Fail With Wrong Url
   [Documentation]  接口名:数据统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects statistics by project id fail 404     project_id=${wrong_url_id}

put projects dot datas camera info by project id dot data id camera info id Success
   [Documentation]  接口名:添加/修改相机信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  reg_code=${reg_code}  coordinate=${coordinate}
   ${unessential_params}  create dictionary
   run every case by params   put projects dot datas camera info by project id dot data id camera info id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}  camera_info_id=${camera_info_id}

put projects dot datas camera info by project id dot data id camera info id Fail With Wrong Url
   [Documentation]  接口名:添加/修改相机信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  reg_code=${reg_code}  coordinate=${coordinate}
   ${unessential_params}  create dictionary
   run every case by params   put projects dot datas camera info by project id dot data id camera info id fail 404   ${essential_params}  ${unessential_params}    project_id=${wrong_url_id}  dot_data_id=${wrong_url_id}  camera_info_id=${camera_info_id}

put projects dot datas camera info by project id dot data id camera info id Fail With Wrong Params
   [Documentation]  接口名:添加/修改相机信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  reg_code=${reg_code_422}  coordinate=${coordinate_422}
   ${unessential_params}  create dictionary
   run every case by params   put projects dot datas camera info by project id dot data id camera info id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}  camera_info_id=${camera_info_id}  success=False

patch projects dot datas status by project id dot data id Success
   [Documentation]  接口名:变更中杆实施记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${status}  convert to integer  ${status}
   ${essential_params}  create dictionary  status=${status}
   ${unessential_params}  create dictionary
   run every case by params   patch projects dot datas status by project id dot data id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}

patch projects dot datas status by project id dot data id Fail With Wrong Url
   [Documentation]  接口名:变更中杆实施记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  status=${status}
   ${unessential_params}  create dictionary
   run every case by params   patch projects dot datas status by project id dot data id fail 404   ${essential_params}  ${unessential_params}    project_id=${wrong_url_id}  dot_data_id=${wrong_url_id}

patch projects dot datas status by project id dot data id Fail With Wrong Params
   [Documentation]  接口名:变更中杆实施记录状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  status=${status_422}
   ${unessential_params}  create dictionary
   run every case by params   patch projects dot datas status by project id dot data id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}  success=False

put projects dot datas by project id dot data id Success
   [Documentation]  接口名:修改勘探记录${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   @{camera_infos}  make camera infos
   ${essential_params}  create dictionary  lon=${lon}  lat=${lat}  address=${address}  poling_type=${poling_type}  height=${height}  cross_arm_num=${cross_arm_num}  camera_infos=@{camera_infos}
   ${unessential_params}  create dictionary  reuse_pole_photo=${reuse_pole_photo}  remark=${remark}
   run every case by params   put projects dot datas by project id dot data id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}

put projects dot datas by project id dot data id Fail With Wrong Url
   [Documentation]  接口名:修改勘探记录${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  lon=${lon}  lat=${lat}  address=${address}  poling_type=${poling_type}  height=${height}  cross_arm_num=${cross_arm_num}  camera_infos=@{camera_infos}
   ${unessential_params}  create dictionary  reuse_pole_photo=${reuse_pole_photo}  remark=${remark}
   run every case by params   put projects dot datas by project id dot data id fail 404   ${essential_params}  ${unessential_params}    project_id=${wrong_url_id}  dot_data_id=${wrong_url_id}

put projects dot datas by project id dot data id Fail With Wrong Params
   [Documentation]  接口名:修改勘探记录${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  lon=${lon_422}  lat=${lat_422}  address=${address_422}  poling_type=${poling_type_422}  height=${height_422}  cross_arm_num=${cross_arm_num_422}  camera_infos=${camera_infos_422}
   ${unessential_params}  create dictionary  reuse_pole_photo=${reuse_pole_photo_422}  remark=${remark_422}
   run every case by params   put projects dot datas by project id dot data id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  dot_data_id=${dot_data_id}  success=False

delete projects dot datas by project id dot data id Success
   [Documentation]  接口名:删除勘探记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete projects dot datas by project id dot data id success 204     project_id=${project_id}  dot_data_id=${dot_data_id}

delete projects dot datas by project id dot data id Fail With Wrong Url
   [Documentation]  接口名:删除勘探记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete projects dot datas by project id dot data id fail 404     project_id=${wrong_url_id}  dot_data_id=${wrong_url_id}


*** Variables ***
${project_id}
${dot_data_id}
${camera_info_id}
@{camera_infos}

*** Keywords ***
post projects dot datas by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post projects dot datas by project id  &{kwargs}
   expect status is 404  ${resp}

post projects dot datas by project id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post projects dot datas by project id  &{kwargs}
   expect status is 201  ${resp}  server_dot/post_projects_dot_datas_by_project_id_201.json
   ${dot_data_id}  set variable if  ${resp.json()}!=[]  ${resp.json()['dot_data_id']}
   set global variable   ${dot_data_id}

post projects dot datas by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post projects dot datas by project id  &{kwargs}
   expect status is 422  ${resp}

get projects dot datas by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas by project id  &{kwargs}
   expect status is 404  ${resp}

get projects dot datas by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas by project id  &{kwargs}
   expect status is 200  ${resp}  server_dot/get_projects_dot_datas_by_project_id_200.json

get projects dot datas by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas by project id  &{kwargs}
   expect status is 422  ${resp}

get projects dot datas by project id dot data id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas by project id dot data id  &{kwargs}
   expect status is 200  ${resp}  server_dot/get_projects_dot_datas_by_project_id_dot_data_id_200.json
   ${camera_info_id}  set variable if  ${resp.json()}!=[]  ${resp.json()['camera_infos'][0]['camera_info_id']}
   set global variable   ${camera_info_id}

get projects dot datas by project id dot data id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas by project id dot data id  &{kwargs}
   expect status is 404  ${resp}

get projects camera infos by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera infos by project id  &{kwargs}
   expect status is 404  ${resp}

get projects camera infos by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera infos by project id  &{kwargs}
   expect status is 200  ${resp}  server_dot/get_projects_camera_infos_by_project_id_200.json

get projects camera infos by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects camera infos by project id  &{kwargs}
   expect status is 422  ${resp}

get projects dot datas camera infos by project id dot data id camera info id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas camera infos by project id dot data id camera info id  &{kwargs}
   expect status is 200  ${resp}  server_dot/get_projects_dot_datas_camera_infos_by_project_id_dot_data_id_camera_info_id_200.json

get projects dot datas camera infos by project id dot data id camera info id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects dot datas camera infos by project id dot data id camera info id  &{kwargs}
   expect status is 404  ${resp}

get projects statistics by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects statistics by project id  &{kwargs}
   expect status is 200  ${resp}  server_dot/get_projects_statistics_by_project_id_200.json

get projects statistics by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects statistics by project id  &{kwargs}
   expect status is 404  ${resp}

put projects dot datas by project id dot data id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas by project id dot data id  &{kwargs}
   expect status is 204  ${resp}

put projects dot datas by project id dot data id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas by project id dot data id  &{kwargs}
   expect status is 404  ${resp}

put projects dot datas by project id dot data id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas by project id dot data id  &{kwargs}
   expect status is 422  ${resp}

put projects dot datas camera info by project id dot data id camera info id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas camera infos by project id dot data id camera info id  &{kwargs}
   expect status is 204  ${resp}

put projects dot datas camera info by project id dot data id camera info id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas camera infos by project id dot data id camera info id  &{kwargs}
   expect status is 404  ${resp}

put projects dot datas camera info by project id dot data id camera info id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put projects dot datas camera infos by project id dot data id camera info id  &{kwargs}
   expect status is 422  ${resp}

patch projects dot datas status by project id dot data id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch projects dot datas status by project id dot data id  &{kwargs}
   expect status is 204  ${resp}

patch projects dot datas status by project id dot data id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch projects dot datas status by project id dot data id  &{kwargs}
   expect status is 404  ${resp}

patch projects dot datas status by project id dot data id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch projects dot datas status by project id dot data id  &{kwargs}
   expect status is 422  ${resp}

delete projects dot datas by project id dot data id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete projects dot datas by project id dot data id  &{kwargs}
   expect status is 204  ${resp}

delete projects dot datas by project id dot data id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete projects dot datas by project id dot data id  &{kwargs}
   expect status is 404  ${resp}

make camera infos
   ${camera_num}  convert to integer  1
   ${power_type}  convert to integer  1
   ${i}  make num  start=0  end=3
   ${j}  make num  end=3
   ${spot_nums}  set variable  ${i}-${j}
   ${camera_info}   create dictionary  brand_name=1   camera_num=${camera_num}  brand_model=康佳ATP-13  power_type=${power_type}  spot_nums=${spot_nums}  brand_short=kj
   @{camera_infos}  create list   ${camera_info}
   [Return]   @{camera_infos}

