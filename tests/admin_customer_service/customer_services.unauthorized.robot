*** Settings ***
Documentation  admin_customer_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.customer_service.CustomerServiceLibrary
Force Tags  model:admin_customer_service  虾洗后台


*** Test Cases ***
post admin customer services finish by customer service id Fail Without Login
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin customer services finish by customer service id fail 403     customer_service_id=${customer_service_id}  opinion=${opinion}  is_refund=${is_refund}    

get admin customer services Fail Without Login
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin customer services fail 403   page_num=${page_num}  page_size=${page_size}    order_no=${order_no}  customer_service_no=${customer_service_no}  car_id=${car_id}  mobile=${mobile}  user_id=${user_id}  reason=${reason}  status=${status}  order_status=${order_status}  start_section=${start_section}  

get admin customer services by customer service id Fail Without Login
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin customer services by customer service id fail 403     customer_service_id=${customer_service_id}

delete admin customer services by customer service id Fail Without Login
   [Documentation]  接口名:售后删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin customer services by customer service id fail 403     customer_service_id=${customer_service_id}


*** Variables ***
${customer_service_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin customer services finish by customer service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin customer services finish by customer service id  &{kwargs}
   expect status is 403  ${resp}  

get admin customer services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services  &{kwargs}
   expect status is 403  ${resp}  

get admin customer services by customer service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services by customer service id  &{kwargs}
   expect status is 403  ${resp}  

delete admin customer services by customer service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin customer services by customer service id  &{kwargs}
   expect status is 403  ${resp}  

