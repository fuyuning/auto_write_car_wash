*** Settings ***
Documentation  wxmp_service_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.service_group.ServiceGroupLibrary
Force Tags  model:wxmp_service_group  车主微信端


*** Test Cases ***
get user service groups price by service group id Fail Without Login
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_series_id=${car_series_id}  
   ${unessential_params}  create list  
   run every case by params  get user service groups price by service group id Fail 403  ${essential_params}  ${unessential_params}    service_group_id/price=${service_group_id/price}


*** Variables ***
${service_group_id/price}  12345678909876543


*** Keywords ***
get user service groups price by service group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user service groups price by service group id  &{kwargs}
   expect status is 403  ${resp}  

