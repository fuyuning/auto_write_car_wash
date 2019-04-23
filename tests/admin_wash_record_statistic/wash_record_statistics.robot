*** Settings ***
Documentation  admin_wash_record_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record_statistic.WashRecordStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_record_statistic  虾洗后台


*** Test Cases ***
Get wash_record_statistic Fail Without Login
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash record statistics by day Fail 403  ${essential_params}  ${unessential_params}



Get wash_record_statistic Success 
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashRecordStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash record statistics by day Success 200  ${essential_params}  ${unessential_params}



Get wash_record_statistic Fail With Wrong Params
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash record statistics by day Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Admin wash record statistics by day Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash record statistics by day   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash record statistics by day Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash record statistics by day   &{kwargs}
   expect status is 200  ${resp}  admin_wash_record_statistic/Get_Admin_wash_record_statistics_by_day_200.json

Get Admin wash record statistics by day Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash record statistics by day   &{kwargs}
   expect status is 422  ${resp}  

