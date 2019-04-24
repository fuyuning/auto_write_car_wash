*** Settings ***
Documentation  admin_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.service.ServiceLibrary
Force Tags  model:admin_service  虾洗后台


*** Test Cases ***
Post Admin Services Fail Without Login
   [Documentation]  接口名:新增服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  standard_time=${standard_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  Post Admin Services Fail 403  ${essential_params}  ${unessential_params}

Get Admin Services Fail Without Login
   [Documentation]  接口名:服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Services Fail 403  ${essential_params}  ${unessential_params}

Put Admin Services By Service Id Fail Without Login
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  standard_time=${standard_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  Put Admin Services By Service Id Fail 403  ${essential_params}  ${unessential_params}  service_id=${service_id}

Delete Admin Services By Service Id Fail Without Login
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Services By Service Id Fail 403  service_id=${service_id}


*** Variables ***
${service_id}  12345678909876543


*** Keywords ***
Post Admin Services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Services   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Services   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Services By Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Services By Service Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Services By Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Services By Service Id   &{kwargs}
   expect status is 403  ${resp}  

