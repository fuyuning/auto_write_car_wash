*** Settings ***
Documentation  admin_intelligent_service
Resource  ../resources.robot
Library  robot_car_wash_server_library.intelligent_service.IntelligentServiceLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_intelligent_service  虾洗后台


*** Test Cases ***
post admin intelligent services Success 
   [Documentation]  接口名:添加智能定价服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create dictionary  order_by=${order_by}  description=${description}  
   run every case by params   post admin intelligent services success 201   ${essential_params}  ${unessential_params}

post admin intelligent services Fail With Wrong Params
   [Documentation]  接口名:添加智能定价服务${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  choose_car_model_id=${choose_car_model_id_422}  cost_price=${cost_price_422}  min_cost_price=${min_cost_price_422}  max_cost_price=${max_cost_price_422}  price=${price_422}  min_price=${min_price_422}  max_price=${max_price_422}  wash_normal_price=${wash_normal_price_422}  min_wash_normal_price=${min_wash_normal_price_422}  max_wash_normal_price=${max_wash_normal_price_422}  wash_group_price=${wash_group_price_422}  min_wash_group_price=${min_wash_group_price_422}  max_wash_group_price=${max_wash_group_price_422}  member_price=${member_price_422}  min_member_price=${min_member_price_422}  max_member_price=${max_member_price_422}  commission_percent=${commission_percent_422}  standard_time=${standard_time_422}  special_car_models=${special_car_models_422}  
   ${unessential_params}  create dictionary  order_by=${order_by_422}  description=${description_422}  
   run every case by params   post admin intelligent services fail 422   ${essential_params}  ${unessential_params}  success=False

get admin intelligent services by intelligent service id Fail With Wrong Url
   [Documentation]  接口名:获取智能定价服务详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin intelligent services by intelligent service id fail 404     intelligent_service_id=${wrong_url_id}

get admin intelligent services by intelligent service id Success 
   [Documentation]  接口名:获取智能定价服务详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 IntelligentService 对象。
   [Tags]           Respcode:200
   get admin intelligent services by intelligent service id success 200     intelligent_service_id=${intelligent_service_id}

get admin intelligent services Success 
   [Documentation]  接口名:获取智能定价服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 IntelligentService 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin intelligent services success 200   ${essential_params}  ${unessential_params}

get admin intelligent services Fail With Wrong Params
   [Documentation]  接口名:获取智能定价服务列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin intelligent services fail 422   ${essential_params}  ${unessential_params}  success=False

put admin intelligent services by intelligent service id Success 
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}  
   ${unessential_params}  create dictionary  order_by=${order_by}  description=${description}  
   run every case by params   put admin intelligent services by intelligent service id success 204   ${essential_params}  ${unessential_params}    intelligent_service_id=${intelligent_service_id}

put admin intelligent services by intelligent service id Fail With Wrong Url
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin intelligent services by intelligent service id fail 404     intelligent_service_id=${wrong_url_id}  name=${name}  choose_car_model_id=${choose_car_model_id}  cost_price=${cost_price}  min_cost_price=${min_cost_price}  max_cost_price=${max_cost_price}  price=${price}  min_price=${min_price}  max_price=${max_price}  wash_normal_price=${wash_normal_price}  min_wash_normal_price=${min_wash_normal_price}  max_wash_normal_price=${max_wash_normal_price}  wash_group_price=${wash_group_price}  min_wash_group_price=${min_wash_group_price}  max_wash_group_price=${max_wash_group_price}  member_price=${member_price}  min_member_price=${min_member_price}  max_member_price=${max_member_price}  commission_percent=${commission_percent}  standard_time=${standard_time}  special_car_models=${special_car_models}    order_by=${order_by}  description=${description}  

put admin intelligent services by intelligent service id Fail With Wrong Params
   [Documentation]  接口名:编辑智能定价服务${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  choose_car_model_id=${choose_car_model_id_422}  cost_price=${cost_price_422}  min_cost_price=${min_cost_price_422}  max_cost_price=${max_cost_price_422}  price=${price_422}  min_price=${min_price_422}  max_price=${max_price_422}  wash_normal_price=${wash_normal_price_422}  min_wash_normal_price=${min_wash_normal_price_422}  max_wash_normal_price=${max_wash_normal_price_422}  wash_group_price=${wash_group_price_422}  min_wash_group_price=${min_wash_group_price_422}  max_wash_group_price=${max_wash_group_price_422}  member_price=${member_price_422}  min_member_price=${min_member_price_422}  max_member_price=${max_member_price_422}  commission_percent=${commission_percent_422}  standard_time=${standard_time_422}  special_car_models=${special_car_models_422}  
   ${unessential_params}  create dictionary  order_by=${order_by_422}  description=${description_422}  
   run every case by params   put admin intelligent services by intelligent service id fail 422   ${essential_params}  ${unessential_params}    intelligent_service_id=${intelligent_service_id}  success=False

delete admin intelligent services by intelligent service id Fail With Wrong Url
   [Documentation]  接口名:删除智能定价服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin intelligent services by intelligent service id fail 404     intelligent_service_id=${wrong_url_id}

delete admin intelligent services by intelligent service id Success 
   [Documentation]  接口名:删除智能定价服务${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin intelligent services by intelligent service id success 204     intelligent_service_id=${intelligent_service_id}


*** Variables ***
${intelligent_service_id}  


*** Keywords ***
post admin intelligent services Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin intelligent services  &{kwargs}
   expect status is 201  ${resp}  admin_intelligent_service/post_admin_intelligent_services_201.json
   ${intelligent_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['intelligent_service_id']}
   set global variable   ${intelligent_service_id}

post admin intelligent services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin intelligent services  &{kwargs}
   expect status is 422  ${resp}  

get admin intelligent services by intelligent service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin intelligent services by intelligent service id  &{kwargs}
   expect status is 404  ${resp}  

get admin intelligent services by intelligent service id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin intelligent services by intelligent service id  &{kwargs}
   expect status is 200  ${resp}  admin_intelligent_service/get_admin_intelligent_services_by_intelligent_service_id_200.json
   ${intelligent_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['intelligent_service_id']}
   set global variable   ${intelligent_service_id}

get admin intelligent services Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin intelligent services  &{kwargs}
   expect status is 200  ${resp}  admin_intelligent_service/get_admin_intelligent_services_200.json
   ${intelligent_service_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['intelligent_service_id']}
   set global variable   ${intelligent_service_id}

get admin intelligent services Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin intelligent services  &{kwargs}
   expect status is 422  ${resp}  

put admin intelligent services by intelligent service id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin intelligent services by intelligent service id  &{kwargs}
   expect status is 204  ${resp}  

put admin intelligent services by intelligent service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin intelligent services by intelligent service id  &{kwargs}
   expect status is 404  ${resp}  

put admin intelligent services by intelligent service id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin intelligent services by intelligent service id  &{kwargs}
   expect status is 422  ${resp}  

delete admin intelligent services by intelligent service id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin intelligent services by intelligent service id  &{kwargs}
   expect status is 404  ${resp}  

delete admin intelligent services by intelligent service id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin intelligent services by intelligent service id  &{kwargs}
   expect status is 204  ${resp}  

