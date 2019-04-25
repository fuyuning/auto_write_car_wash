*** Settings ***
Documentation  admin_service_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.service_group.ServiceGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_service_group  虾洗后台


*** Test Cases ***
Post Admin Service Groups Success 
   [Documentation]  接口名:新增套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  pricing_strategy=${pricing_strategy}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Post Admin Service Groups Success 201  ${essential_params}  ${unessential_params}

Post Admin Service Groups Fail With Wrong Params
   [Documentation]  接口名:新增套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_group_name=${service_group_name_422}  service_original_price=${service_original_price_422}  pricing_strategy=${pricing_strategy_422}  cost_price=${cost_price_422}  service_original_price=${service_original_price_422}  wash_normal_price=${wash_normal_price_422}  wash_group_price=${wash_group_price_422}  membership_price=${membership_price_422}  order_by=${order_by_422}  description=${description_422}  
   ${unessential_params}  create list  commission_price=${commission_price_422}  wash_normal_percent=${wash_normal_percent_422}  wash_group_percent=${wash_group_percent_422}  membership_percent=${membership_percent_422}  service_ids=${service_ids_422}  intelligent_service_ids=${intelligent_service_ids_422}  
   run every case by params  Post Admin Service Groups Fail 422  ${essential_params}  ${unessential_params}

Get Admin Service Groups Success 
   [Documentation]  接口名:套餐列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ServiceGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  pricing_strategy=${pricing_strategy}  service_group_name=${service_group_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Service Groups Success 200  ${essential_params}  ${unessential_params}

Get Admin Service Groups Fail With Wrong Params
   [Documentation]  接口名:套餐列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  pricing_strategy=${pricing_strategy_422}  service_group_name=${service_group_name_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Service Groups Fail 422  ${essential_params}  ${unessential_params}

Put Admin Service Groups By Service Group Id Fail With Wrong Params
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_group_name=${service_group_name_422}  service_original_price=${service_original_price_422}  cost_price=${cost_price_422}  service_original_price=${service_original_price_422}  wash_normal_price=${wash_normal_price_422}  wash_group_price=${wash_group_price_422}  membership_price=${membership_price_422}  order_by=${order_by_422}  description=${description_422}  
   ${unessential_params}  create list  commission_price=${commission_price_422}  wash_normal_percent=${wash_normal_percent_422}  wash_group_percent=${wash_group_percent_422}  membership_percent=${membership_percent_422}  service_ids=${service_ids_422}  intelligent_service_ids=${intelligent_service_ids_422}  
   run every case by params  Put Admin Service Groups By Service Group Id Fail 422  ${essential_params}  ${unessential_params}  service_group_id=${service_group_id}

Put Admin Service Groups By Service Group Id Success 
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Put Admin Service Groups By Service Group Id Success 204  ${essential_params}  ${unessential_params}  service_group_id=${service_group_id}

Put Admin Service Groups By Service Group Id Fail With Wrong Url
   [Documentation]  接口名:编辑套餐${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  service_group_name=${service_group_name}  service_original_price=${service_original_price}  cost_price=${cost_price}  service_original_price=${service_original_price}  wash_normal_price=${wash_normal_price}  wash_group_price=${wash_group_price}  membership_price=${membership_price}  order_by=${order_by}  description=${description}  
   ${unessential_params}  create list  commission_price=${commission_price}  wash_normal_percent=${wash_normal_percent}  wash_group_percent=${wash_group_percent}  membership_percent=${membership_percent}  service_ids=${service_ids}  intelligent_service_ids=${intelligent_service_ids}  
   run every case by params  Put Admin Service Groups By Service Group Id Fail 404  ${essential_params}  ${unessential_params}  service_group_id=${wrong_url_id}

Delete Admin Service Groups By Service Group Id Fail With Wrong Url
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Service Groups By Service Group Id Fail 404  service_group_id=${wrong_url_id}

Delete Admin Service Groups By Service Group Id Success 
   [Documentation]  接口名:删除服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Service Groups By Service Group Id Success 204  service_group_id=${service_group_id}


*** Variables ***
${service_group_id}  


*** Keywords ***
Post Admin Service Groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Service Groups   &{kwargs}
   expect status is 201  ${resp}  admin_service_group/Post_Admin_Service_Groups_201.json
   ${service_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_group_id]}
   set global variable   ${service_group_id}

Post Admin Service Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Service Groups   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Service Groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Service Groups   &{kwargs}
   expect status is 200  ${resp}  admin_service_group/Get_Admin_Service_Groups_200.json
   ${service_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_group_id]}
   set global variable   ${service_group_id}

Get Admin Service Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Service Groups   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Service Groups By Service Group Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Service Groups By Service Group Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Service Groups By Service Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Service Groups By Service Group Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Service Groups By Service Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Service Groups By Service Group Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Service Groups By Service Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Service Groups By Service Group Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Service Groups By Service Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Service Groups By Service Group Id   &{kwargs}
   expect status is 204  ${resp}  

