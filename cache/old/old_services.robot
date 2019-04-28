*** Settings ***
Documentation  admin_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.service.ServiceLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_service  虾洗后台


*** Test Cases ***
post admin services Fail With Wrong Params
   [Documentation]  接口名:新增服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_name=${service_name_422}  cost_price=${cost_price_422}  price=${price_422}  wash_normal_price=${wash_normal_price_422}  wash_group_price=${wash_group_price_422}  member_price=${member_price_422}  commission_price=${commission_price_422}  standard_time=${standard_time_422}  
   ${unessential_params}  create list  description=${description_422}  order_by=${order_by_422}  
   run every case by params  post admin services Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin services Success 
   [Documentation]  接口名:新增服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  standard_time=${standard_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  post admin services Success 201  ${essential_params}  ${unessential_params}

get admin services Success 
   [Documentation]  接口名:服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Service 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin services Success 200  ${essential_params}  ${unessential_params}

get admin services Fail With Wrong Params
   [Documentation]  接口名:服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin services Fail 422  ${essential_params}  ${unessential_params}  success=False

put admin services by service id Fail With Wrong Url
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  standard_time=${standard_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  put admin services by service id Fail 404  ${essential_params}  ${unessential_params}    service_id=${w}

put admin services by service id Fail With Wrong Params
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_name=${service_name_422}  cost_price=${cost_price_422}  price=${price_422}  wash_normal_price=${wash_normal_price_422}  wash_group_price=${wash_group_price_422}  member_price=${member_price_422}  commission_price=${commission_price_422}  standard_time=${standard_time_422}  
   ${unessential_params}  create list  description=${description_422}  order_by=${order_by_422}  
   run every case by params  put admin services by service id Fail 422  ${essential_params}  ${unessential_params}    service_id=${service_id}  success=False

put admin services by service id Success 
   [Documentation]  接口名:更改服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  service_name=${service_name}  cost_price=${cost_price}  price=${price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  member_price=${member_price}  commission_price=${commission_price}  standard_time=${standard_time}  
   ${unessential_params}  create list  description=${description}  order_by=${order_by}  
   run every case by params  put admin services by service id Success 204  ${essential_params}  ${unessential_params}    service_id=${service_id}

delete admin services by service id Fail With Wrong Url
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin services by service id Fail 404    service_id=${w}


*** Variables ***
${service_id}  


*** Keywords ***
post admin services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin services  &{kwargs}
   expect status is 422  ${resp}  

post admin services Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin services  &{kwargs}
   expect status is 201  ${resp}  admin_service/post_admin_services_201.json
   ${service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_id]}
   set global variable   ${service_id}

get admin services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin services  &{kwargs}
   expect status is 200  ${resp}  admin_service/get_admin_services_200.json
   ${service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_id]}
   set global variable   ${service_id}

get admin services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin services  &{kwargs}
   expect status is 422  ${resp}  

put admin services by service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 404  ${resp}  

put admin services by service id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 422  ${resp}  

put admin services by service id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin services by service id  &{kwargs}
   expect status is 204  ${resp}  

delete admin services by service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin services by service id  &{kwargs}
   expect status is 404  ${resp}  

