*** Settings ***
Documentation  wxmp_service_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.service_group.ServiceGroupLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_service_group  车主微信端


*** Test Cases ***
get user service groups price by service group id Fail With Wrong Url
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_series_id=${car_series_id}  
   ${unessential_params}  create list  
   run every case by params  get user service groups price by service group id Fail 404  ${essential_params}  ${unessential_params}    service_group_id=${wrong_url_id}

get user service groups price by service group id Success 
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_series_id=${car_series_id}  
   ${unessential_params}  create list  
   run every case by params  get user service groups price by service group id Success 200  ${essential_params}  ${unessential_params}    service_group_id=${service_group_id}

get user service groups price by service group id Fail With Wrong Params
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_series_id=${car_series_id_422}  
   ${unessential_params}  create list  
   run every case by params  get user service groups price by service group id Fail 422  ${essential_params}  ${unessential_params}    service_group_id=${service_group_id}  success=False


*** Variables ***
${service_group_id}  


*** Keywords ***
get user service groups price by service group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user service groups price by service group id  &{kwargs}
   expect status is 404  ${resp}  

get user service groups price by service group id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user service groups price by service group id  &{kwargs}
   expect status is 200  ${resp}  wxmp_service_group/get_user_service_groups_price_by_service_group_id_200.json
   ${service_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_group_id]}
   set global variable   ${service_group_id}

get user service groups price by service group id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get user service groups price by service group id  &{kwargs}
   expect status is 422  ${resp}  

