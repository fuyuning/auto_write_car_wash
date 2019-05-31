*** Settings ***
Documentation  server_record
Resource  ../resources.robot
Library  robot_camera_monitor_server_library.record.RecordLibrary
Force Tags  model:server_record  


*** Test Cases ***
get projects cameras identify records by project id camera id Fail Without Login
   [Documentation]  接口名:获取识别记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects cameras identify records by project id camera id fail 403     project_id=${project_id}  camera_id=${camera_id}    identify_record_id=${identify_record_id}  identify_result_id=${identify_result_id}  spot_num=${spot_num}  vehicle_id=${vehicle_id}  status=${status}  identify_section=${identify_section}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  

get projects cameras identify records by project id camera id identify record id Fail Without Login
   [Documentation]  接口名:获取识别记录详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects cameras identify records by project id camera id identify record id fail 403     project_id=${project_id}  camera_id=${camera_id}  identify_record_id=${identify_record_id}

get projects spots parking records by project id spot id Fail Without Login
   [Documentation]  接口名:获取停车记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects spots parking records by project id spot id fail 403     project_id=${project_id}  spot_id=${spot_id}  time_point=${time_point}    car_id=${car_id}  vehicle_id=${vehicle_id}  entry_section=${entry_section}  exit_section=${exit_section}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  

get projects spots spot records by project id Fail Without Login
   [Documentation]  接口名:获取泊位记录列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects spots spot records by project id fail 403     project_id=${project_id}  section=${section}    spot_num=${spot_num}  reg_code=${reg_code}  page_size=${page_size}  page_num=${page_num}  order_by=${order_by}  

get projects spot spot records by project id spot id Fail Without Login
   [Documentation]  接口名:获取泊位记录${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get projects spot spot records by project id spot id fail 403     project_id=${project_id}  spot_id=${spot_id}  section=${section}    


*** Variables ***
${project_id}  1a2b3c4d5e6f7zz
${camera_id}  1a2b3c4d5e6f7zz
${identify_record_id}  1a2b3c4d5e6f7zz
${spot_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get projects cameras identify records by project id camera id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras identify records by project id camera id  &{kwargs}
   expect status is 403  ${resp}  

get projects cameras identify records by project id camera id identify record id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects cameras identify records by project id camera id identify record id  &{kwargs}
   expect status is 403  ${resp}  

get projects spots parking records by project id spot id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots parking records by project id spot id  &{kwargs}
   expect status is 403  ${resp}  

get projects spots spot records by project id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects spots spot records by project id  &{kwargs}
   expect status is 403  ${resp}  

get projects spot spot records by project id spot id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get projects spot spot records by project id spot id  &{kwargs}
   expect status is 403  ${resp}  

