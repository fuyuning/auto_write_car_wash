*** Settings ***
Documentation  admin_car_series
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series.CarSeriesLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_series  虾洗后台


*** Test Cases ***
Get Admin Car Series Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarSeries 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  is_active=False  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Series Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Series Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  is_active=False  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Series Fail 422  ${essential_params}  ${unessential_params}

Put Admin Car Series By Car Series Id Success 
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Car Series By Car Series Id Success 204  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}

Put Admin Car Series By Car Series Id Fail With Wrong Url
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Car Series By Car Series Id Fail 404  ${essential_params}  ${unessential_params}  car_series_id=${wrong_url_id}

Put Admin Car Series By Car Series Id Fail With Wrong Params
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Car Series By Car Series Id Fail 422  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}

Patch Admin Car Series By Car Series Id Success 
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Car Series By Car Series Id Success 204  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}

Patch Admin Car Series By Car Series Id Fail With Wrong Url
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Car Series By Car Series Id Fail 404  ${essential_params}  ${unessential_params}  car_series_id=${wrong_url_id}

Patch Admin Car Series By Car Series Id Fail With Wrong Params
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Car Series By Car Series Id Fail 422  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}


*** Variables ***
${car_series_id}


*** Keywords ***
Get Admin Car Series Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Series   &{kwargs}
   expect status is 200  ${resp}  admin_car_series/Get_Admin_Car_Series_200.json
   ${car_series_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_series_id]}
   set global variable   ${car_series_id}

Get Admin Car Series Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Series   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Car Series By Car Series Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Series By Car Series Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Car Series By Car Series Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Series By Car Series Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Car Series By Car Series Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Series By Car Series Id   &{kwargs}
   expect status is 422  ${resp}  

Patch Admin Car Series By Car Series Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Car Series By Car Series Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Admin Car Series By Car Series Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Car Series By Car Series Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Admin Car Series By Car Series Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Car Series By Car Series Id   &{kwargs}
   expect status is 422  ${resp}  

