*** Settings ***
Documentation  admin_service_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.service_group.ServiceGroupLibrary
Force Tags  model:admin_service_group  虾洗后台


*** Test Cases ***
post admin service groups Fail Without Login
   [Documentation]  接口名:新增套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  pricing_strategy=${pricing_strategy}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  post admin service groups Fail 403  ${essential_params}  ${unessential_params}

get admin service groups Fail Without Login
   [Documentation]  接口名:套餐列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  pricing_strategy=${pricing_strategy}  service_group_name=${service_group_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin service groups Fail 403  ${essential_params}  ${unessential_params}

put admin service groups by service group id Fail Without Login
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  put admin service groups by service group id Fail 403  ${essential_params}  ${unessential_params}    service_group_id=${service_group_id}

delete admin service groups by service group id Fail Without Login
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin service groups by service group id Fail 403    service_group_id=${service_group_id}


*** Variables ***
${service_group_id}  12345678909876543


*** Keywords ***
post admin service groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin service groups  &{kwargs}
   expect status is 403  ${resp}  

get admin service groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin service groups  &{kwargs}
   expect status is 403  ${resp}  

put admin service groups by service group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin service groups by service group id  &{kwargs}
   expect status is 403  ${resp}  

delete admin service groups by service group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin service groups by service group id  &{kwargs}
   expect status is 403  ${resp}  

