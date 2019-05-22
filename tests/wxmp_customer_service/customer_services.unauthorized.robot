*** Settings ***
Documentation  wxmp_customer_service
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.customer_service.CustomerServiceLibrary
Force Tags  model:wxmp_customer_service  车主微信端


*** Test Cases ***
post user customer services Fail Without Login
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  post user customer services Fail 403  ${essential_params}  ${unessential_params}

get user customer services Fail Without Login
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get user customer services Fail 403  ${essential_params}  ${unessential_params}

get user customer services by customer service id Fail Without Login
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user customer services by customer service id Fail 403    customer_service_id=${customer_service_id}


*** Variables ***
${customer_service_id}  12345678909876543


*** Keywords ***
post user customer services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user customer services  &{kwargs}
   expect status is 403  ${resp}  

get user customer services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services  &{kwargs}
   expect status is 403  ${resp}  

get user customer services by customer service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services by customer service id  &{kwargs}
   expect status is 403  ${resp}  

