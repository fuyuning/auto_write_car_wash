*** Settings ***
Documentation  wxmp_customer_service
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.customer_service.CustomerServiceLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_customer_service  车主微信端


*** Test Cases ***
Post User Customer Services Fail With Wrong Params
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  Post User Customer Services Fail 422  ${essential_params}  ${unessential_params}

Post User Customer Services Success 
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=${is_refund}  
   ${unessential_params}  create list  
   run every case by params  Post User Customer Services Success 201  ${essential_params}  ${unessential_params}

Get User Customer Services Fail With Wrong Url
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get User Customer Services Fail 404  ${essential_params}  ${unessential_params}

Get User Customer Services Success 
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CustomerService 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get User Customer Services Success 200  ${essential_params}  ${unessential_params}

Get User Customer Services Fail With Wrong Params
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get User Customer Services Fail 422  ${essential_params}  ${unessential_params}

Get User Customer Services By Customer Service Id Fail With Wrong Url
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get User Customer Services By Customer Service Id Fail 404  customer_service_id=${wrong_url_id}

Get User Customer Services By Customer Service Id Success 
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CustomerService 对象。
   [Tags]           Respcode:200
   Get User Customer Services By Customer Service Id Success 200  customer_service_id=${customer_service_id}


*** Variables ***
${customer_service_id}  


*** Keywords ***
Post User Customer Services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User Customer Services   &{kwargs}
   expect status is 422  ${resp}  

Post User Customer Services Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post User Customer Services   &{kwargs}
   expect status is 201  ${resp}  wxmp_customer_service/Post_User_Customer_Services_201.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

Get User Customer Services Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User Customer Services   &{kwargs}
   expect status is 404  ${resp}  

Get User Customer Services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Customer Services   &{kwargs}
   expect status is 200  ${resp}  wxmp_customer_service/Get_User_Customer_Services_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

Get User Customer Services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get User Customer Services   &{kwargs}
   expect status is 422  ${resp}  

Get User Customer Services By Customer Service Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User Customer Services By Customer Service Id   &{kwargs}
   expect status is 404  ${resp}  

Get User Customer Services By Customer Service Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Customer Services By Customer Service Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_customer_service/Get_User_Customer_Services_By_Customer_Service_Id_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

