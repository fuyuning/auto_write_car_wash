*** Settings ***
Documentation  admin_wash_record_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record_statistic.WashRecordStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_record_statistic  虾洗后台


*** Test Cases ***
get admin wash record statistics by day Success 
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecordStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  parking_id=${parking_id}  wash_area_id=${wash_area_id}  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin wash record statistics by day success 200   ${essential_params}  ${unessential_params}

get admin wash record statistics by day Fail With Wrong Params
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  parking_id=${parking_id_422}  wash_area_id=${wash_area_id_422}  order_by=${order_by_422}  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin wash record statistics by day fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get admin wash record statistics by day Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash record statistics by day  &{kwargs}
   expect status is 200  ${resp}  admin_wash_record_statistic/get_admin_wash_record_statistics_by_day_200.json

get admin wash record statistics by day Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash record statistics by day  &{kwargs}
   expect status is 422  ${resp}  

