*** Settings ***
Documentation  wxmp_service_group
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.service_group.ServiceGroupLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_service_group  车主微信端


*** Test Cases ***
Get service_group By Id Fail With Wrong Url
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_series_id=${car_series_id}  
   ${unessential_params}  create list  
   run every case by params  Get user service groups By Id Fail 404  ${essential_params}  ${unessential_params}  service_group_id/price=${wrong_url_id}



Get service_group By Id Fail Without Login
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_series_id=${car_series_id}  
   ${unessential_params}  create list  
   run every case by params  Get user service groups By Id Fail 403  ${essential_params}  ${unessential_params}  service_group_id/price=${service_group_id/price}



Get service_group By Id Success 
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_series_id=${car_series_id}  
   ${unessential_params}  create list  
   run every case by params  Get user service groups By Id Success 200  ${essential_params}  ${unessential_params}  service_group_id/price=${service_group_id/price}



Get service_group By Id Fail With Wrong Params
   [Documentation]  接口名:根据套餐、车型获取智能定价${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_series_id=${car_series_id}  
   ${unessential_params}  create list  
   run every case by params  Get user service groups By Id Fail 422  ${essential_params}  ${unessential_params}  service_group_id/price=${service_group_id/price}



*** Variables ***
${service_group_id/price}


*** Keywords ***
Get User service groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get price by service group id  &{kwargs}
   expect status is 404  ${resp}  

Get User service groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get price by service group id  &{kwargs}
   expect status is 403  ${resp}  

Get User service groups By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get price by service group id  &{kwargs}
   expect status is 200  ${resp}  wxmp_service_group/Get_User_service_groups_By_Id_200.json
   ${service_group_id/price}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][service_group_id/price]}
   set global variable   ${service_group_id/price}

Get User service groups By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get price by service group id  &{kwargs}
   expect status is 422  ${resp}  

