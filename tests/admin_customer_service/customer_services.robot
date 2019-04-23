*** Settings ***
Documentation  admin_customer_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.customer_service.CustomerServiceLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_customer_service  虾洗后台


*** Test Cases ***
Post customer_service By Id Fail With Wrong Url
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  opinion=${opinion}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  Post admin customer services By Id Fail 404  ${essential_params}  ${unessential_params}  customer_service_id/finish=${wrong_url_id}



Post customer_service By Id Fail Without Login
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  opinion=${opinion}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  Post admin customer services By Id Fail 403  ${essential_params}  ${unessential_params}  customer_service_id/finish=${customer_service_id/finish}



Post customer_service By Id Success 
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  opinion=${opinion}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  Post admin customer services By Id Success 204  ${essential_params}  ${unessential_params}  customer_service_id/finish=${customer_service_id/finish}



Post customer_service By Id Fail With Wrong Params
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  opinion=${opinion}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  Post admin customer services By Id Fail 422  ${essential_params}  ${unessential_params}  customer_service_id/finish=${customer_service_id/finish}



Get customer_service Fail Without Login
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  order_no=${order_no}  customer_service_no=${customer_service_no}  car_id=${car_id}  mobile=${mobile}  user_id=${user_id}  reason=${reason}  status=${status}  order_status=${order_status}  start_section=${start_section}  
   run every case by params  Get admin customer services Fail 403  ${essential_params}  ${unessential_params}



Get customer_service Success 
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 customer_service 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  order_no=${order_no}  customer_service_no=${customer_service_no}  car_id=${car_id}  mobile=${mobile}  user_id=${user_id}  reason=${reason}  status=${status}  order_status=${order_status}  start_section=${start_section}  
   run every case by params  Get admin customer services Success 200  ${essential_params}  ${unessential_params}



Get customer_service Fail With Wrong Params
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  order_no=${order_no}  customer_service_no=${customer_service_no}  car_id=${car_id}  mobile=${mobile}  user_id=${user_id}  reason=${reason}  status=${status}  order_status=${order_status}  start_section=${start_section}  
   run every case by params  Get admin customer services Fail 422  ${essential_params}  ${unessential_params}



Get customer_service By Id Fail With Wrong Url
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin customer services By Id Fail 404  customer_service_id=${wrong_url_id}



Get customer_service By Id Fail Without Login
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin customer services By Id Fail 403  customer_service_id=${customer_service_id}



Get customer_service By Id Success 
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 customer_service 对象。
   [Tags]           Respcode:200
   Get admin customer services By Id Success 200  customer_service_id=${customer_service_id}



Delete customer_service By Id Success 
   [Documentation]  接口名:售后删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin customer services By Id Success 204  customer_service_id=${customer_service_id}



Delete customer_service By Id Fail Without Login
   [Documentation]  接口名:售后删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin customer services By Id Fail 403  customer_service_id=${customer_service_id}



Delete customer_service By Id Fail With Wrong Url
   [Documentation]  接口名:售后删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin customer services By Id Fail 404  customer_service_id=${wrong_url_id}



*** Variables ***
${customer_service_id/finish}
${customer_service_id}


*** Keywords ***
Post Admin customer services By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post finish by customer service id  &{kwargs}
   expect status is 404  ${resp}  

Post Admin customer services By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post finish by customer service id  &{kwargs}
   expect status is 403  ${resp}  

Post Admin customer services By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post finish by customer service id  &{kwargs}
   expect status is 204  ${resp}  

Post Admin customer services By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post finish by customer service id  &{kwargs}
   expect status is 422  ${resp}  

Get Admin customer services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services   &{kwargs}
   expect status is 403  ${resp}  

Get Admin customer services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services   &{kwargs}
   expect status is 200  ${resp}  admin_customer_service/Get_Admin_customer_services_200.json
   ${customer_service_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id/finish]}
   set global variable   ${customer_service_id/finish}
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

Get Admin customer services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services   &{kwargs}
   expect status is 422  ${resp}  

Get Admin customer services By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services by customer service id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin customer services By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services by customer service id  &{kwargs}
   expect status is 403  ${resp}  

Get Admin customer services By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services by customer service id  &{kwargs}
   expect status is 200  ${resp}  admin_customer_service/Get_Admin_customer_services_By_Id_200.json
   ${customer_service_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id/finish]}
   set global variable   ${customer_service_id/finish}
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

Delete Admin customer services By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin customer services by customer service id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin customer services By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin customer services by customer service id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin customer services By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin customer services by customer service id  &{kwargs}
   expect status is 404  ${resp}  

