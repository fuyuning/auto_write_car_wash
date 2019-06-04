*** Settings ***
Documentation  admin_intelligent_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.intelligent_service.IntelligentServiceLibrary
Force Tags  model:admin_intelligent_service  虾洗后台


*** Test Cases ***
post admin intelligent services Fail Without Login
   [Documentation]  接口名:添加智能定价服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin intelligent services fail 403   name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}    order_by=${order_by}  description=${description}  

get admin intelligent services by intelligent service id Fail Without Login
   [Documentation]  接口名:获取智能定价服务详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin intelligent services by intelligent service id fail 403     intelligent_service_id=${intelligent_service_id}

get admin intelligent services Fail Without Login
   [Documentation]  接口名:获取智能定价服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin intelligent services fail 403     page_num=${page_num}  page_size=${page_size}  

put admin intelligent services by intelligent service id Fail Without Login
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin intelligent services by intelligent service id fail 403     intelligent_service_id=${intelligent_service_id}  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}    order_by=${order_by}  description=${description}  

delete admin intelligent services by intelligent service id Fail Without Login
   [Documentation]  接口名:删除智能定价服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin intelligent services by intelligent service id fail 403     intelligent_service_id=${intelligent_service_id}


*** Variables ***
${intelligent_service_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin intelligent services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin intelligent services  &{kwargs}
   expect status is 403  ${resp}  

get admin intelligent services by intelligent service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin intelligent services by intelligent service id  &{kwargs}
   expect status is 403  ${resp}  

get admin intelligent services Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin intelligent services  &{kwargs}
   expect status is 403  ${resp}  

put admin intelligent services by intelligent service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin intelligent services by intelligent service id  &{kwargs}
   expect status is 403  ${resp}  

delete admin intelligent services by intelligent service id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin intelligent services by intelligent service id  &{kwargs}
   expect status is 403  ${resp}  

