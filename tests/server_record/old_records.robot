*** Settings ***
Documentation  server_record
Resource  ../resources.robot
Library  robot_camera_monitor_deployment_server.record.RecordLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:server_record  


*** Test Cases ***
get projects cameras identify records by project id camera id Success 
   [Documentation]  接口名:获取识别记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 IdentifyRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  identify_record_id=${identify_record_id}  identify_result_id=${identify_result_id}  spot_num=${spot_num}  vehicle_id=${vehicle_id}  status=${status}  identify_section=${identify_section}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  
   run every case by params   get projects cameras identify records by project id camera id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}

get projects cameras identify records by project id camera id Fail With Wrong Url
   [Documentation]  接口名:获取识别记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects cameras identify records by project id camera id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}

get projects cameras identify records by project id camera id Fail With Wrong Params
   [Documentation]  接口名:获取识别记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  identify_record_id=${identify_record_id_422}  identify_result_id=${identify_result_id_422}  spot_num=${spot_num_422}  vehicle_id=${vehicle_id_422}  status=${status_422}  identify_section=${identify_section_422}  page_size=${page_size_422}  page_num=${page_num_422}  order_by=${order_by_422}  
   run every case by params   get projects cameras identify records by project id camera id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  camera_id=${camera_id}  success=False

get projects cameras identify records by project id camera id identify record id Success 
   [Documentation]  接口名:获取识别记录详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 IdentifyRecord 对象。
   [Tags]           Respcode:200
   get projects cameras identify records by project id camera id identify record id success 200     project_id=${project_id}  camera_id=${camera_id}  identify_record_id=${identify_record_id}

get projects cameras identify records by project id camera id identify record id Fail With Wrong Url
   [Documentation]  接口名:获取识别记录详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects cameras identify records by project id camera id identify record id fail 404     project_id=${wrong_url_id}  camera_id=${wrong_url_id}  identify_record_id=${wrong_url_id}

get projects spots parking records by project id spot id Success 
   [Documentation]  接口名:获取停车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ParkingRecord 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  time_point=${time_point}  
   ${unessential_params}  create dictionary  car_id=${car_id}  vehicle_id=${vehicle_id}  entry_section=${entry_section}  exit_section=${exit_section}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  
   run every case by params   get projects spots parking records by project id spot id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}  spot_id=${spot_id}

get projects spots parking records by project id spot id Fail With Wrong Url
   [Documentation]  接口名:获取停车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects spots parking records by project id spot id fail 404     project_id=${wrong_url_id}  spot_id=${wrong_url_id}

get projects spots parking records by project id spot id Fail With Wrong Params
   [Documentation]  接口名:获取停车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  time_point=${time_point_422}  
   ${unessential_params}  create dictionary  car_id=${car_id_422}  vehicle_id=${vehicle_id_422}  entry_section=${entry_section_422}  exit_section=${exit_section_422}  page_size=${page_size_422}  page_num=${page_num_422}  order_by=${order_by_422}  
   run every case by params   get projects spots parking records by project id spot id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  spot_id=${spot_id}  success=False

get projects spots spot records by project id Success 
   [Documentation]  接口名:获取泊位记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Spot 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  section=${section}  
   ${unessential_params}  create dictionary  spot_num=${spot_num}  reg_code=${reg_code}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  
   run every case by params   get projects spots spot records by project id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}

get projects spots spot records by project id Fail With Wrong Url
   [Documentation]  接口名:获取泊位记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects spots spot records by project id fail 404     project_id=${wrong_url_id}

get projects spots spot records by project id Fail With Wrong Params
   [Documentation]  接口名:获取泊位记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  section=${section_422}  
   ${unessential_params}  create dictionary  spot_num=${spot_num_422}  reg_code=${reg_code_422}  page_size=${page_size_422}  page_num=${page_num_422}  order_by=${order_by_422}  
   run every case by params   get projects spots spot records by project id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  success=False

get projects spot spot records by project id spot id Success 
   [Documentation]  接口名:获取泊位记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Spot 对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  section=${section}  
   ${unessential_params}  create dictionary  
   run every case by params   get projects spot spot records by project id spot id success 200   ${essential_params}  ${unessential_params}    project_id=${project_id}  spot_id=${spot_id}

get projects spot spot records by project id spot id Fail With Wrong Url
   [Documentation]  接口名:获取泊位记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get projects spot spot records by project id spot id fail 404     project_id=${wrong_url_id}  spot_id=${wrong_url_id}

get projects spot spot records by project id spot id Fail With Wrong Params
   [Documentation]  接口名:获取泊位记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  section=${section_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get projects spot spot records by project id spot id fail 422   ${essential_params}  ${unessential_params}    project_id=${project_id}  spot_id=${spot_id}  success=False


*** Variables ***
${project_id}  
${camera_id}  
${identify_record_id}  
${spot_id}  


*** Keywords ***
get projects cameras identify records by project id camera id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras identify records by project id camera id  &{kwargs}
   expect status is 200  ${resp}  server_record/get_projects_cameras_identify_records_by_project_id_camera_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${identify_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][identify_record_id]}
   set global variable   ${identify_record_id}
   ${spot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][spot_id]}
   set global variable   ${spot_id}

get projects cameras identify records by project id camera id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras identify records by project id camera id  &{kwargs}
   expect status is 404  ${resp}  

get projects cameras identify records by project id camera id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras identify records by project id camera id  &{kwargs}
   expect status is 422  ${resp}  

get projects cameras identify records by project id camera id identify record id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras identify records by project id camera id identify record id  &{kwargs}
   expect status is 200  ${resp}  server_record/get_projects_cameras_identify_records_by_project_id_camera_id_identify_record_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${identify_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][identify_record_id]}
   set global variable   ${identify_record_id}
   ${spot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][spot_id]}
   set global variable   ${spot_id}

get projects cameras identify records by project id camera id identify record id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras identify records by project id camera id identify record id  &{kwargs}
   expect status is 404  ${resp}  

get projects spots parking records by project id spot id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots parking records by project id spot id  &{kwargs}
   expect status is 200  ${resp}  server_record/get_projects_spots_parking_records_by_project_id_spot_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${identify_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][identify_record_id]}
   set global variable   ${identify_record_id}
   ${spot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][spot_id]}
   set global variable   ${spot_id}

get projects spots parking records by project id spot id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots parking records by project id spot id  &{kwargs}
   expect status is 404  ${resp}  

get projects spots parking records by project id spot id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots parking records by project id spot id  &{kwargs}
   expect status is 422  ${resp}  

get projects spots spot records by project id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots spot records by project id  &{kwargs}
   expect status is 200  ${resp}  server_record/get_projects_spots_spot_records_by_project_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${identify_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][identify_record_id]}
   set global variable   ${identify_record_id}
   ${spot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][spot_id]}
   set global variable   ${spot_id}

get projects spots spot records by project id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots spot records by project id  &{kwargs}
   expect status is 404  ${resp}  

get projects spots spot records by project id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots spot records by project id  &{kwargs}
   expect status is 422  ${resp}  

get projects spot spot records by project id spot id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get projects spot spot records by project id spot id  &{kwargs}
   expect status is 200  ${resp}  server_record/get_projects_spot_spot_records_by_project_id_spot_id_200.json
   ${project_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][project_id]}
   set global variable   ${project_id}
   ${camera_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][camera_id]}
   set global variable   ${camera_id}
   ${identify_record_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][identify_record_id]}
   set global variable   ${identify_record_id}
   ${spot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][spot_id]}
   set global variable   ${spot_id}

get projects spot spot records by project id spot id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get projects spot spot records by project id spot id  &{kwargs}
   expect status is 404  ${resp}  

get projects spot spot records by project id spot id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get projects spot spot records by project id spot id  &{kwargs}
   expect status is 422  ${resp}  

