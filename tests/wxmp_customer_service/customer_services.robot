*** Settings ***
Documentation  wxmp_customer_service
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.customer_service.CustomerServiceLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_customer_service  车主微信端


*** Test Cases ***
Post customer_service Success 
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=False  
   ${unessential_params}  create list  
   run every case by params  Post user customer services Success 201  ${essential_params}  ${unessential_params}



Post customer_service Fail With Wrong Params
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=False  
   ${unessential_params}  create list  
   run every case by params  Post user customer services Fail 422  ${essential_params}  ${unessential_params}



Post customer_service Fail Without Login
   [Documentation]  接口名:添加售后服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_record_id=${wash_record_id}  reason=${reason}  description=${description}  is_refund=False  
   ${unessential_params}  create list  
   run every case by params  Post user customer services Fail 403  ${essential_params}  ${unessential_params}



Get customer_service Fail With Wrong Url
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get user customer services Fail 404  ${essential_params}  ${unessential_params}



Get customer_service Fail Without Login
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get user customer services Fail 403  ${essential_params}  ${unessential_params}



Get customer_service Success 
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CustomerService 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get user customer services Success 200  ${essential_params}  ${unessential_params}



Get customer_service Fail With Wrong Params
   [Documentation]  接口名:获取售后服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  status=${status}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get user customer services Fail 422  ${essential_params}  ${unessential_params}



Get customer_service By Id Fail With Wrong Url
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get user customer services By Id Fail 404  customer_service_id=${wrong_url_id}



Get customer_service By Id Fail Without Login
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get user customer services By Id Fail 403  customer_service_id=${customer_service_id}



Get customer_service By Id Success 
   [Documentation]  接口名:获取单个售后服务${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CustomerService 对象。
   [Tags]           Respcode:200
   Get user customer services By Id Success 200  customer_service_id=${customer_service_id}



*** Variables ***
${customer_service_id}


*** Keywords ***
Post User customer services Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user customer services   &{kwargs}
   expect status is 201  ${resp}  wxmp_customer_service/Post_User_customer_services_201.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

Post User customer services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user customer services   &{kwargs}
   expect status is 422  ${resp}  

Post User customer services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user customer services   &{kwargs}
   expect status is 403  ${resp}  

Get User customer services Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services   &{kwargs}
   expect status is 404  ${resp}  

Get User customer services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services   &{kwargs}
   expect status is 403  ${resp}  

Get User customer services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services   &{kwargs}
   expect status is 200  ${resp}  wxmp_customer_service/Get_User_customer_services_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

Get User customer services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services   &{kwargs}
   expect status is 422  ${resp}  

Get User customer services By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services by customer service id  &{kwargs}
   expect status is 404  ${resp}  

Get User customer services By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services by customer service id  &{kwargs}
   expect status is 403  ${resp}  

Get User customer services By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user customer services by customer service id  &{kwargs}
   expect status is 200  ${resp}  wxmp_customer_service/Get_User_customer_services_By_Id_200.json
   ${customer_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][customer_service_id]}
   set global variable   ${customer_service_id}

