*** Settings ***
Documentation  admin_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.service.ServiceLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_service  虾洗后台


*** Test Cases ***
Post service Success 
   [Documentation]  接口名:新增服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  service_time=${service_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  Post admin services Success 201  ${essential_params}  ${unessential_params}



Post service Fail With Wrong Params
   [Documentation]  接口名:新增服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  service_time=${service_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  Post admin services Fail 422  ${essential_params}  ${unessential_params}



Post service Fail Without Login
   [Documentation]  接口名:新增服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  service_time=${service_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  Post admin services Fail 403  ${essential_params}  ${unessential_params}



Get service Fail Without Login
   [Documentation]  接口名:服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin services Fail 403  ${essential_params}  ${unessential_params}



Get service Success 
   [Documentation]  接口名:服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Service 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin services Success 200  ${essential_params}  ${unessential_params}



Get service Fail With Wrong Params
   [Documentation]  接口名:服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin services Fail 422  ${essential_params}  ${unessential_params}



Put service By Id Success 
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  service_time=${service_time}  
   run every case by params  Put admin services By Id Success 204  ${essential_params}  ${unessential_params}  service_id=${service_id}



Put service By Id Fail With Wrong Url
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  service_time=${service_time}  
   run every case by params  Put admin services By Id Fail 404  ${essential_params}  ${unessential_params}  service_id=${wrong_url_id}



Put service By Id Fail With Wrong Params
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  service_time=${service_time}  
   run every case by params  Put admin services By Id Fail 422  ${essential_params}  ${unessential_params}  service_id=${service_id}



Put service By Id Fail Without Login
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  service_time=${service_time}  
   run every case by params  Put admin services By Id Fail 403  ${essential_params}  ${unessential_params}  service_id=${service_id}



Delete service By Id Fail With Wrong Url
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin services By Id Fail 404  service_id=${wrong_url_id}



Delete service By Id Fail Without Login
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin services By Id Fail 403  service_id=${service_id}



*** Variables ***
${service_id}


*** Keywords ***
Post Admin services Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin services   &{kwargs}
   expect status is 201  ${resp}  admin_service/Post_Admin_services_201.json
   ${service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_id]}
   set global variable   ${service_id}

Post Admin services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin services   &{kwargs}
   expect status is 422  ${resp}  

Post Admin services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin services   &{kwargs}
   expect status is 403  ${resp}  

Get Admin services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin services   &{kwargs}
   expect status is 403  ${resp}  

Get Admin services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin services   &{kwargs}
   expect status is 200  ${resp}  admin_service/Get_Admin_services_200.json
   ${service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_id]}
   set global variable   ${service_id}

Get Admin services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin services   &{kwargs}
   expect status is 422  ${resp}  

Put Admin services By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin services By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 404  ${resp}  

Put Admin services By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin services By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin services By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin services by service id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin services By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin services by service id  &{kwargs}
   expect status is 403  ${resp}  

