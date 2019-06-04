*** Settings ***
Documentation  admin_car_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_statistic.CarStatisticLibrary
Force Tags  model:admin_car_statistic  虾洗后台


*** Test Cases ***
get admin car statistics Fail Without Login
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car statistics fail 403     car_id=${car_id}  last_section=${last_section}  order_by=${order_by}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  page_num=${page_num}  page_size=${page_size}  

patch admin car statistics visible by car statistic id Fail Without Login
   [Documentation]  接口名:车辆统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin car statistics visible by car statistic id fail 403     car_statistic_id=${car_statistic_id}  visible=False    


*** Variables ***
${car_statistic_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin car statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car statistics  &{kwargs}
   expect status is 403  ${resp}  

patch admin car statistics visible by car statistic id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car statistics visible by car statistic id  &{kwargs}
   expect status is 403  ${resp}  

