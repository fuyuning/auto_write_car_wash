*** Settings ***
Documentation  admin_intelligent_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.intelligent_service.IntelligentServiceLibrary
Force Tags  model:admin_intelligent_service  虾洗后台


*** Test Cases ***
Post Admin Intelligent Services Fail Without Login
   [Documentation]  接口名:添加智能定价服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create list  order_by=${order_by}  description=${description}  
   run every case by params  Post Admin Intelligent Services Fail 403  ${essential_params}  ${unessential_params}

Get Admin Intelligent Services By Intelligent Service Id Fail Without Login
   [Documentation]  接口名:获取智能定价服务详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Intelligent Services By Intelligent Service Id Fail 403  intelligent_service_id=${intelligent_service_id}

Get Admin Intelligent Services Fail Without Login
   [Documentation]  接口名:获取智能定价服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Intelligent Services Fail 403  ${essential_params}  ${unessential_params}

Put Admin Intelligent Services By Intelligent Service Id Fail Without Login
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create list  order_by=${order_by}  description=${description}  
   run every case by params  Put Admin Intelligent Services By Intelligent Service Id Fail 403  ${essential_params}  ${unessential_params}  intelligent_service_id=${intelligent_service_id}

Delete Admin Intelligent Services By Intelligent Service Id Fail Without Login
   [Documentation]  接口名:删除智能定价服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Intelligent Services By Intelligent Service Id Fail 403  intelligent_service_id=${intelligent_service_id}


*** Variables ***
${intelligent_service_id}


*** Keywords ***
Post Admin Intelligent Services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Intelligent Services   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Intelligent Services By Intelligent Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Intelligent Services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Intelligent Services   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Intelligent Services By Intelligent Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Intelligent Services By Intelligent Service Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Intelligent Services By Intelligent Service Id   &{kwargs}
   expect status is 403  ${resp}  

