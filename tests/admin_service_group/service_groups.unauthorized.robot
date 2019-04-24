*** Settings ***
Documentation  admin_service_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.service_group.ServiceGroupLibrary
Force Tags  model:admin_service_group  虾洗后台


*** Test Cases ***
Post Admin Service Groups Fail Without Login
   [Documentation]  接口名:新增套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  pricing_strategy=${pricing_strategy}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Post Admin Service Groups Fail 403  ${essential_params}  ${unessential_params}

Get Admin Service Groups Fail Without Login
   [Documentation]  接口名:套餐列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  pricing_strategy=${pricing_strategy}  service_group_name=${service_group_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Service Groups Fail 403  ${essential_params}  ${unessential_params}

Put Admin Service Groups By Service Group Id Fail Without Login
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Put Admin Service Groups By Service Group Id Fail 403  ${essential_params}  ${unessential_params}  service_group_id=${service_group_id}

Delete Admin Service Groups By Service Group Id Fail Without Login
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Service Groups By Service Group Id Fail 403  service_group_id=${service_group_id}


*** Variables ***
${service_group_id}  12345678909876543


*** Keywords ***
Post Admin Service Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Service Groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Service Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Service Groups   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Service Groups By Service Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Service Groups By Service Group Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Service Groups By Service Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Service Groups By Service Group Id   &{kwargs}
   expect status is 403  ${resp}  

