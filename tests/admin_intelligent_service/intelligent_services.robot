*** Settings ***
Documentation  admin_intelligent_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.intelligent_service.IntelligentServiceLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_intelligent_service  虾洗后台


*** Test Cases ***
Post Admin Intelligent Services Success 
   [Documentation]  接口名:添加智能定价服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create list  order_by=${order_by}  description=${description}  
   run every case by params  Post Admin Intelligent Services Success 201  ${essential_params}  ${unessential_params}

Post Admin Intelligent Services Fail With Wrong Params
   [Documentation]  接口名:添加智能定价服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create list  order_by=${order_by}  description=${description}  
   run every case by params  Post Admin Intelligent Services Fail 422  ${essential_params}  ${unessential_params}

Get Admin Intelligent Services By Intelligent Service Id Fail With Wrong Url
   [Documentation]  接口名:获取智能定价服务详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Intelligent Services By Intelligent Service Id Fail 404  intelligent_service_id=${wrong_url_id}

Get Admin Intelligent Services By Intelligent Service Id Success 
   [Documentation]  接口名:获取智能定价服务详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 IntelligentService 对象。
   [Tags]           Respcode:200
   Get Admin Intelligent Services By Intelligent Service Id Success 200  intelligent_service_id=${intelligent_service_id}

Get Admin Intelligent Services Success 
   [Documentation]  接口名:获取智能定价服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 IntelligentService 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Intelligent Services Success 200  ${essential_params}  ${unessential_params}

Get Admin Intelligent Services Fail With Wrong Params
   [Documentation]  接口名:获取智能定价服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Intelligent Services Fail 422  ${essential_params}  ${unessential_params}

Put Admin Intelligent Services By Intelligent Service Id Success 
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create list  order_by=${order_by}  description=${description}  
   run every case by params  Put Admin Intelligent Services By Intelligent Service Id Success 204  ${essential_params}  ${unessential_params}  intelligent_service_id=${intelligent_service_id}

Put Admin Intelligent Services By Intelligent Service Id Fail With Wrong Url
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create list  order_by=${order_by}  description=${description}  
   run every case by params  Put Admin Intelligent Services By Intelligent Service Id Fail 404  ${essential_params}  ${unessential_params}  intelligent_service_id=${wrong_url_id}

Put Admin Intelligent Services By Intelligent Service Id Fail With Wrong Params
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create list  order_by=${order_by}  description=${description}  
   run every case by params  Put Admin Intelligent Services By Intelligent Service Id Fail 422  ${essential_params}  ${unessential_params}  intelligent_service_id=${intelligent_service_id}

Delete Admin Intelligent Services By Intelligent Service Id Fail With Wrong Url
   [Documentation]  接口名:删除智能定价服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Intelligent Services By Intelligent Service Id Fail 404  intelligent_service_id=${wrong_url_id}

Delete Admin Intelligent Services By Intelligent Service Id Success 
   [Documentation]  接口名:删除智能定价服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Intelligent Services By Intelligent Service Id Success 204  intelligent_service_id=${intelligent_service_id}


*** Variables ***
${intelligent_service_id}  


*** Keywords ***
Post Admin Intelligent Services Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Intelligent Services   &{kwargs}
   expect status is 201  ${resp}  admin_intelligent_service/Post_Admin_Intelligent_Services_201.json
   ${intelligent_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][intelligent_service_id]}
   set global variable   ${intelligent_service_id}

Post Admin Intelligent Services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Intelligent Services   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Intelligent Services By Intelligent Service Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Intelligent Services By Intelligent Service Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 200  ${resp}  admin_intelligent_service/Get_Admin_Intelligent_Services_By_Intelligent_Service_Id_200.json
   ${intelligent_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][intelligent_service_id]}
   set global variable   ${intelligent_service_id}

Get Admin Intelligent Services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Intelligent Services   &{kwargs}
   expect status is 200  ${resp}  admin_intelligent_service/Get_Admin_Intelligent_Services_200.json
   ${intelligent_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][intelligent_service_id]}
   set global variable   ${intelligent_service_id}

Get Admin Intelligent Services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Intelligent Services   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Intelligent Services By Intelligent Service Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Intelligent Services By Intelligent Service Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Intelligent Services By Intelligent Service Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin Intelligent Services By Intelligent Service Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Intelligent Services By Intelligent Service Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 204  ${resp}  

