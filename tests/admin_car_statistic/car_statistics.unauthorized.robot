*** Settings ***
Documentation  admin_car_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_statistic.CarStatisticLibrary
Force Tags  model:admin_car_statistic  虾洗后台


*** Test Cases ***
Get Admin Car Statistics Fail Without Login
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  last_section=${last_section}  order_by=${order_by}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Statistics Fail 403  ${essential_params}  ${unessential_params}

Patch Visible By Car Statistic Id Fail Without Login
   [Documentation]  接口名:车辆统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch Visible By Car Statistic Id Fail 403  ${essential_params}  ${unessential_params}  car_statistic_id/visible=${car_statistic_id/visible}


*** Variables ***
${car_statistic_id/visible}  12345678909876543


*** Keywords ***
Get Admin Car Statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Statistics   &{kwargs}
   expect status is 403  ${resp}  

Patch Visible By Car Statistic Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Visible By Car Statistic Id   &{kwargs}
   expect status is 403  ${resp}  

