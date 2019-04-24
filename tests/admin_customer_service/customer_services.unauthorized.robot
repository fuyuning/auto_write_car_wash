*** Settings ***
Documentation  admin_customer_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.customer_service.CustomerServiceLibrary
Force Tags  model:admin_customer_service  虾洗后台


*** Test Cases ***
Post Finish By Customer Service Id Fail Without Login
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  opinion=${opinion}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  Post Finish By Customer Service Id Fail 403  ${essential_params}  ${unessential_params}  customer_service_id/finish=${customer_service_id/finish}

Get Admin Customer Services Fail Without Login
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  order_no=${order_no}  customer_service_no=${customer_service_no}  car_id=${car_id}  mobile=${mobile}  user_id=${user_id}  reason=${reason}  status=${status}  order_status=${order_status}  start_section=${start_section}  
   run every case by params  Get Admin Customer Services Fail 403  ${essential_params}  ${unessential_params}

Get Admin Customer Services By Customer Service Id Fail Without Login
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Customer Services By Customer Service Id Fail 403  customer_service_id=${customer_service_id}

Delete Admin Customer Services By Customer Service Id Fail Without Login
   [Documentation]  接口名:售后删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Customer Services By Customer Service Id Fail 403  customer_service_id=${customer_service_id}


*** Variables ***
${customer_service_id/finish}  12345678909876543
${customer_service_id}  12345678909876543


*** Keywords ***
Post Finish By Customer Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Finish By Customer Service Id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Customer Services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Customer Services   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Customer Services By Customer Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Customer Services By Customer Service Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Customer Services By Customer Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Customer Services By Customer Service Id   &{kwargs}
   expect status is 403  ${resp}  

