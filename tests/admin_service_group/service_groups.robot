*** Settings ***
Documentation  admin_service_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.service_group.ServiceGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_service_group  虾洗后台


*** Test Cases ***
Post service_group Fail Without Login
   [Documentation]  接口名:新增套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  pricing_strategy=${pricing_strategy}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Post admin service groups Fail 403  ${essential_params}  ${unessential_params}



Post service_group Success 
   [Documentation]  接口名:新增套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  pricing_strategy=${pricing_strategy}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Post admin service groups Success 201  ${essential_params}  ${unessential_params}



Post service_group Fail With Wrong Params
   [Documentation]  接口名:新增套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  pricing_strategy=${pricing_strategy}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Post admin service groups Fail 422  ${essential_params}  ${unessential_params}



Get service_group Fail Without Login
   [Documentation]  接口名:套餐列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  pricing_strategy=${pricing_strategy}  service_group_name=${service_group_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin service groups Fail 403  ${essential_params}  ${unessential_params}



Get service_group Success 
   [Documentation]  接口名:套餐列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ServiceGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  pricing_strategy=${pricing_strategy}  service_group_name=${service_group_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin service groups Success 200  ${essential_params}  ${unessential_params}



Get service_group Fail With Wrong Params
   [Documentation]  接口名:套餐列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  pricing_strategy=${pricing_strategy}  service_group_name=${service_group_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin service groups Fail 422  ${essential_params}  ${unessential_params}



Put service_group By Id Success 
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Put admin service groups By Id Success 204  ${essential_params}  ${unessential_params}  service_group_id=${service_group_id}



Put service_group By Id Fail With Wrong Params
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Put admin service groups By Id Fail 422  ${essential_params}  ${unessential_params}  service_group_id=${service_group_id}



Put service_group By Id Fail Without Login
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Put admin service groups By Id Fail 403  ${essential_params}  ${unessential_params}  service_group_id=${service_group_id}



Put service_group By Id Fail With Wrong Url
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Put admin service groups By Id Fail 404  ${essential_params}  ${unessential_params}  service_group_id=${wrong_url_id}



Delete service_group By Id Success 
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin service groups By Id Success 204  service_group_id=${service_group_id}



Delete service_group By Id Fail With Wrong Url
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin service groups By Id Fail 404  service_group_id=${wrong_url_id}



Delete service_group By Id Fail Without Login
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin service groups By Id Fail 403  service_group_id=${service_group_id}



*** Variables ***
${service_group_id}


*** Keywords ***
Post Admin service groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin service groups   &{kwargs}
   expect status is 403  ${resp}  

Post Admin service groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin service groups   &{kwargs}
   expect status is 201  ${resp}  admin_service_group/Post_Admin_service_groups_201.json
   ${service_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_group_id]}
   set global variable   ${service_group_id}

Post Admin service groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin service groups   &{kwargs}
   expect status is 422  ${resp}  

Get Admin service groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin service groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin service groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin service groups   &{kwargs}
   expect status is 200  ${resp}  admin_service_group/Get_Admin_service_groups_200.json
   ${service_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_group_id]}
   set global variable   ${service_group_id}

Get Admin service groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin service groups   &{kwargs}
   expect status is 422  ${resp}  

Put Admin service groups By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin service groups by service group id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin service groups By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin service groups by service group id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin service groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin service groups by service group id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin service groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin service groups by service group id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin service groups By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin service groups by service group id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin service groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin service groups by service group id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin service groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin service groups by service group id  &{kwargs}
   expect status is 403  ${resp}  

