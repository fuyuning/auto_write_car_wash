*** Settings ***
Documentation  admin_wash_record_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_record_statistic.WashRecordStatisticLibrary
Force Tags  model:admin_wash_record_statistic  虾洗后台


*** Test Cases ***
get admin wash record statistics by day Fail Without Login
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash record statistics by day fail 403     parking_id=${parking_id}  wash_area_id=${wash_area_id}  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get admin wash record statistics by day Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash record statistics by day  &{kwargs}
   expect status is 403  ${resp}  

