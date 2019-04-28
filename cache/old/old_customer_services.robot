*** Settings ***
Documentation  wxmp_customer_service
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.customer_service.CustomerServiceLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_customer_service  车主微信端


*** Test Cases ***
post user customer services Fail With Wrong Params
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_record_id=${wash_record_id_422}  reason=${reason_422}  description=${description_422}  is_refund=${is_refund_422}  
   ${unessential_params}  create list  
   run every case by params  post user customer services Fail 422  ${essential_params}  ${unessential_params}  success=False

post user customer services Success 
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  post user customer services Success 201  ${essential_params}  ${unessential_params}

get user customer services Success 
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CustomerService 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get user customer services Success 200  ${essential_params}  ${unessential_params}

get user customer services Fail With Wrong Params
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get user customer services Fail 422  ${essential_params}  ${unessential_params}  success=False

get user customer services by customer service id Fail With Wrong Url
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get user customer services by customer service id Fail 404    customer_service_id=${wrong_url_id}

get user customer services by customer service id Success 
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CustomerService 对象。
   [Tags]           Respcode:200
   get user customer services by customer service id Success 200    customer_service_id=${customer_service_id}


*** Variables ***
${customer_service_id}  


*** Keywords ***
post user customer services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user customer services  &{kwargs}
   expect status is 422  ${resp}  

post user customer services Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user customer services  &{kwargs}
   expect status is 201  ${resp}  wxmp_customer_service/post_user_customer_services_201.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

get user customer services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services  &{kwargs}
   expect status is 200  ${resp}  wxmp_customer_service/get_user_customer_services_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

get user customer services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services  &{kwargs}
   expect status is 422  ${resp}  

get user customer services by customer service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services by customer service id  &{kwargs}
   expect status is 404  ${resp}  

get user customer services by customer service id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services by customer service id  &{kwargs}
   expect status is 200  ${resp}  wxmp_customer_service/get_user_customer_services_by_customer_service_id_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

