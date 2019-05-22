*** Settings ***
Documentation  server_spot
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.spot.SpotLibrary  WITH NAME  spot
Library  robot_camera_monitor_deployment_server.project.ProjectLibrary  WITH NAME  project
Suite Setup  spot.Login  ${admin_username}   ${admin_password}
Suite Teardown  spot.Logout
Force Tags  model:server_spot  中杆后台


*** Test Cases ***
post projects spots import by project id Success 
   [Documentation]  接口名:导入泊位${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${project_name}  make num
   ${project_name}  set variable  robot${project_name}
   ${resp}=  project.post_projects  project_name=${project_name}  province=${province}  city=${city}  district=${district}  address=${address}  region_id=${region_id}  camera_brand_id=${camera_brand_id}
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()['project_id']}
   set global variable   ${project_id}
   ${car_position}  make num  end=7
   write xls           rows=5  cols_name=序号,车位编号,分类,车位长度（米）,车位宽度（米）,经度,纬度,道路名称,起始道路,终止道路  cols_value=0,${car_position},一类,5.0,3.1,123.45,41.1234,随机道路,随机道路,随机道路  sheet_name=sheet1  file_name=tests/server_spot/spot_info.xlsx
   post projects spots import by project id success 204     project_id=${project_id}  file=tests/server_spot/spot_info.xlsx

post projects spots import by project id Fail With Wrong Url
   [Documentation]  接口名:导入泊位${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post projects spots import by project id fail 404     project_id=${wrong_url_id}  file=tests/server_spot/spot_info.xlsx

get projects spots by project id Success 
   [Documentation]  接口名:获取泊位列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Spot 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  spot_num=${spot_num}  spot_type=${spot_type}  road_name=${road_name}  start_road=${start_road}  end_road=${end_road}  section=${section}  page_num=${page_num}  page_size=${page_size}
   run every case by params   get projects spots by project id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}
   get projects spots by project id success 200  project_id=${project_id}

get projects spots by project id Fail With Wrong Url
   [Documentation]  接口名:获取泊位列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  spot_num=${spot_num}  spot_type=${spot_type}  road_name=${road_name}  start_road=${start_road}  end_road=${end_road}  section=${section}  page_num=${page_num}  page_size=${page_size}
   run every case by params   get projects spots by project id fail 404   ${essential_params}  ${unessential_params}    project_id=${wrong_url_id}

get projects spots by project id Fail With Wrong Params
   [Documentation]  接口名:获取泊位列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary
   ${unessential_params}  create dictionary  page_num=${page_num_422}  page_size=${page_size_422}
   run every case by params   get projects spots by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

delete projects spots by project id spot id Success 
   [Documentation]  接口名:删除单个泊位${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete projects spots by project id spot id success 204     project_id=${project_id}  spot_id=${spot_id}

delete projects spots by project id spot id Fail With Wrong Url
   [Documentation]  接口名:删除单个泊位${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete projects spots by project id spot id fail 404     project_id=${wrong_url_id}  spot_id=${wrong_url_id}

delete projects spots by project id Success 
   [Documentation]  接口名:删除所有泊位${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete projects spots by project id success 204     project_id=${project_id}

delete projects spots by project id Fail With Wrong Url
   [Documentation]  接口名:删除所有泊位${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete projects spots by project id fail 404     project_id=${wrong_url_id}


*** Variables ***
${project_id}  
${spot_id}  


*** Keywords ***
post projects spots import by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post projects spots import by project id  &{kwargs}
   expect status is 204  ${resp}

post projects spots import by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post projects spots import by project id  &{kwargs}
   expect status is 404  ${resp}  

get projects spots by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots by project id  &{kwargs}
   expect status is 200  ${resp}  server_spot/get_projects_spots_by_project_id_200.json
   ${spot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['spot_id']}
   set global variable   ${spot_id}

get projects spots by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots by project id  &{kwargs}
   expect status is 404  ${resp}  

get projects spots by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots by project id  &{kwargs}
   expect status is 422  ${resp}  

delete projects spots by project id spot id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete projects spots by project id spot id  &{kwargs}
   expect status is 204  ${resp}  

delete projects spots by project id spot id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete projects spots by project id spot id  &{kwargs}
   expect status is 404  ${resp}  

delete projects spots by project id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete projects spots by project id  &{kwargs}
   expect status is 204  ${resp}  

delete projects spots by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete projects spots by project id  &{kwargs}
   expect status is 404  ${resp}  

