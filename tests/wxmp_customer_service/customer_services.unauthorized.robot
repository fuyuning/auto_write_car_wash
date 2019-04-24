*** Settings ***
Documentation  wxmp_customer_service
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.customer_service.CustomerServiceLibrary
Force Tags  model:wxmp_customer_service  车主微信端


Post User Customer Services Fail Without Login
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=False  
   ${unessential_params}  create list  
   run every case by params  Post User Customer Services Fail 403  ${essential_params}  ${unessential_params}

Get User Customer Services Fail Without Login
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get User Customer Services Fail 403  ${essential_params}  ${unessential_params}

Get User Customer Services By Customer Service Id Fail Without Login
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get User Customer Services By Customer Service Id Fail 403  customer_service_id=${customer_service_id}

Post User Customer Services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User Customer Services   &{kwargs}
   expect status is 403  ${resp}  

Get User Customer Services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Customer Services   &{kwargs}
   expect status is 403  ${resp}  

Get User Customer Services By Customer Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Customer Services By Customer Service Id   &{kwargs}
   expect status is 403  ${resp}  

