*** Settings ***
Documentation  admin_customer_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.customer_service.CustomerServiceLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_customer_service  虾洗后台


*** Test Cases ***
post admin customer services finish by customer service id Fail With Wrong Url
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post admin customer services finish by customer service id fail 404     customer_service_id=${wrong_url_id}  opinion=${opinion}  is_refund=${is_refund}    

post admin customer services finish by customer service id Success 
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  opinion=${opinion}  is_refund=${is_refund}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin customer services finish by customer service id success 204   ${essential_params}  ${unessential_params}    customer_service_id=${customer_service_id}

post admin customer services finish by customer service id Fail With Wrong Params
   [Documentation]  接口名:售后修改${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  opinion=${opinion_422}  is_refund=${is_refund_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin customer services finish by customer service id fail 422   ${essential_params}  ${unessential_params}    customer_service_id=${customer_service_id}  success=False

get admin customer services Success 
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 customer_service 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create dictionary  order_no=${order_no}  customer_service_no=${customer_service_no}  car_id=${car_id}  mobile=${mobile}  user_id=${user_id}  reason=${reason}  status=${status}  order_status=${order_status}  start_section=${start_section}  
   run every case by params   get admin customer services success 200   ${essential_params}  ${unessential_params}

get admin customer services Fail With Wrong Params
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  page_num=${page_num_422}  page_size=${page_size_422}  
   ${unessential_params}  create dictionary  order_no=${order_no_422}  customer_service_no=${customer_service_no_422}  car_id=${car_id_422}  mobile=${mobile_422}  user_id=${user_id_422}  reason=${reason_422}  status=${status_422}  order_status=${order_status_422}  start_section=${start_section_422}  
   run every case by params   get admin customer services fail 422   ${essential_params}  ${unessential_params}  success=False

get admin customer services by customer service id Fail With Wrong Url
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin customer services by customer service id fail 404     customer_service_id=${wrong_url_id}

get admin customer services by customer service id Success 
   [Documentation]  接口名:售后查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 customer_service 对象。
   [Tags]           Respcode:200
   get admin customer services by customer service id success 200     customer_service_id=${customer_service_id}

delete admin customer services by customer service id Success 
   [Documentation]  接口名:售后删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin customer services by customer service id success 204     customer_service_id=${customer_service_id}

delete admin customer services by customer service id Fail With Wrong Url
   [Documentation]  接口名:售后删除记录${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin customer services by customer service id fail 404     customer_service_id=${wrong_url_id}


*** Variables ***
${customer_service_id}  


*** Keywords ***
post admin customer services finish by customer service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post admin customer services finish by customer service id  &{kwargs}
   expect status is 404  ${resp}  

post admin customer services finish by customer service id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin customer services finish by customer service id  &{kwargs}
   expect status is 204  ${resp}  

post admin customer services finish by customer service id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin customer services finish by customer service id  &{kwargs}
   expect status is 422  ${resp}  

get admin customer services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services  &{kwargs}
   expect status is 200  ${resp}  admin_customer_service/get_admin_customer_services_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['customer_service_id']}
   set global variable   ${customer_service_id}

get admin customer services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services  &{kwargs}
   expect status is 422  ${resp}  

get admin customer services by customer service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services by customer service id  &{kwargs}
   expect status is 404  ${resp}  

get admin customer services by customer service id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin customer services by customer service id  &{kwargs}
   expect status is 200  ${resp}  admin_customer_service/get_admin_customer_services_by_customer_service_id_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['customer_service_id']}
   set global variable   ${customer_service_id}

delete admin customer services by customer service id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin customer services by customer service id  &{kwargs}
   expect status is 204  ${resp}  

delete admin customer services by customer service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin customer services by customer service id  &{kwargs}
   expect status is 404  ${resp}  

