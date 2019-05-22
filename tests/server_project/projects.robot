*** Settings ***
Documentation  server_project
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.project.ProjectLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:server_project  中杆后台


*** Test Cases ***
get camera brands Success
   [Documentation]  接口名:获取相机品牌信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CameraBrand 列表。
   [Tags]           Respcode:200
    get camera brands success 200

post projects Success
   [Documentation]  接口名:添加项目${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${project_name}  make num
   ${project_name}  set variable  robot${project_name}
   set global variable  ${project_name}
   post projects success 201   project_name=${project_name}  province=${province}  city=${city}  district=${district}  address=${address}  region_id=${region_id}  camera_brand_id=${camera_brand_id}  leader=${leader}  mobile=${mobile}  status=${status}

post projects Fail With Wrong Params
   [Documentation]  接口名:添加项目${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  project_name=${project_name_422}  province=${province_422}  city=${city_422}  district=${district_422}  address=${address_422}  region_id=${region_id_422}  camera_brand_id=${camera_brand_id_422}
   ${unessential_params}  create dictionary  leader=${leader_422}  mobile=${mobile_422}  status=${status_422}
   run every case by params   post projects fail 422   ${essential_params}  ${unessential_params}  success=False

get projects Success
   [Documentation]  接口名:获取项目列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Project 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  project_name=${project_name}  page_size=${page_size}  page_num=${page_num}   status=${status}
   run every case by params   get projects success 200   ${essential_params}  ${unessential_params}

get projects Fail With Wrong Params
   [Documentation]  接口名:获取项目列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  page_size=${page_size_422}  page_num=${page_num_422}   status=${status_422}
   run every case by params   get projects fail 422   ${essential_params}  ${unessential_params}  success=False

get projects equipment list export by project id Success
   [Documentation]  接口名:导出设备清单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,无Json数据返回。
   [Tags]           Respcode:200
   get projects equipment list export by project id success 200     project_id=${project_id}

get projects equipment list export by project id Fail With Wrong Url
   [Documentation]  接口名:导出设备清单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects equipment list export by project id fail 404     project_id=${wrong_url_id}

get projects export by project id Success
   [Documentation]  接口名:导出项目文件${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,无Json数据返回。
   [Tags]           Respcode:200
   get projects export by project id success 200     project_id=${project_id}

get projects export by project id Fail With Wrong Url
   [Documentation]  接口名:导出项目文件${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects export by project id fail 404     project_id=${wrong_url_id}

put projects by project id Success
   [Documentation]  接口名:修改项目${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  project_name=${project_name}  province=${province}  city=${city}  district=${district}  address=${address}  region_id=${region_id}  camera_brand_id=${camera_brand_id}
   ${unessential_params}  create dictionary  leader=${leader}  mobile=${mobile}   status=${status}
   run every case by params   put projects by project id success 204   ${essential_params}  ${unessential_params}    project_id=${project_id}

put projects by project id Fail With Wrong Url
   [Documentation]  接口名:修改项目${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary  project_name=${project_name}  province=${province}  city=${city}  district=${district}  address=${address}  region_id=${region_id}  camera_brand_id=${camera_brand_id}
   ${unessential_params}  create dictionary  leader=${leader}  mobile=${mobile}    status=${status}
   run every case by params   put projects by project id fail 404   ${essential_params}  ${unessential_params}    project_id=${wrong_url_id}

put projects by project id Fail With Wrong Params
   [Documentation]  接口名:修改项目${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  project_name=${project_name_422}  province=${province_422}  city=${city_422}  district=${district_422}  address=${address_422}  region_id=${region_id_422}  camera_brand_id=${camera_brand_id_422}
   ${unessential_params}  create dictionary  leader=${leader_422}  mobile=${mobile_422}   status=${status_422}
   run every case by params   put projects by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

delete projects by project id Success
   [Documentation]  接口名:删除项目${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete projects by project id success 204     project_id=${project_id}

delete projects by project id Fail With Wrong Url
   [Documentation]  接口名:删除项目${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete projects by project id fail 404     project_id=${wrong_url_id}


*** Variables ***
${project_id}
${camera_brand_id}


*** Keywords ***
post projects Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post projects  &{kwargs}
   expect status is 201  ${resp}  server_project/post_projects_201.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()['project_id']}
   set global variable   ${project_id}

post projects Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post projects  &{kwargs}
   expect status is 422  ${resp}

get projects Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects  &{kwargs}
   expect status is 200  ${resp}  server_project/get_projects_200.json

get projects Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects  &{kwargs}
   expect status is 422  ${resp}

get projects equipment list export by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects equipment list export by project id  &{kwargs}
   expect status is 200  ${resp}  NoSchema

get projects equipment list export by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects equipment list export by project id  &{kwargs}
   expect status is 404  ${resp}

get projects export by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects export by project id  &{kwargs}
   expect status is 200  ${resp}  NoSchema

get projects export by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects export by project id  &{kwargs}
   expect status is 404  ${resp}

get camera brands Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get camera brands  &{kwargs}
   expect status is 200  ${resp}  server_project/get_camera_brands_200.json
   ${camera_brand_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['camera_brand_id']}
   set global variable   ${camera_brand_id}

put projects by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put projects by project id  &{kwargs}
   expect status is 204  ${resp}

put projects by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put projects by project id  &{kwargs}
   expect status is 404  ${resp}

put projects by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put projects by project id  &{kwargs}
   expect status is 422  ${resp}

delete projects by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete projects by project id  &{kwargs}
   expect status is 204  ${resp}

delete projects by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete projects by project id  &{kwargs}
   expect status is 404  ${resp}

