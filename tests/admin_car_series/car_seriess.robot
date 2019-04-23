*** Settings ***
Documentation  admin_car_series
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series.CarSeriesLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_series  虾洗后台


*** Test Cases ***
Get car_series Fail Without Login
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  is_active=False  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car series Fail 403  ${essential_params}  ${unessential_params}



Get car_series Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarSeries 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  is_active=False  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car series Success 200  ${essential_params}  ${unessential_params}



Get car_series Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  is_active=False  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car series Fail 422  ${essential_params}  ${unessential_params}



Put car_series By Id Success 
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin car series By Id Success 204  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}



Put car_series By Id Fail Without Login
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin car series By Id Fail 403  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}



Put car_series By Id Fail With Wrong Url
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin car series By Id Fail 404  ${essential_params}  ${unessential_params}  car_series_id=${wrong_url_id}



Put car_series By Id Fail With Wrong Params
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put admin car series By Id Fail 422  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}



Patch car_series By Id Success 
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin car series By Id Success 204  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}



Patch car_series By Id Fail Without Login
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin car series By Id Fail 403  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}



Patch car_series By Id Fail With Wrong Url
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin car series By Id Fail 404  ${essential_params}  ${unessential_params}  car_series_id=${wrong_url_id}



Patch car_series By Id Fail With Wrong Params
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin car series By Id Fail 422  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}



*** Variables ***
${car_series_id}


*** Keywords ***
Get Admin car series Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series   &{kwargs}
   expect status is 403  ${resp}  

Get Admin car series Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series   &{kwargs}
   expect status is 200  ${resp}  admin_car_series/Get_Admin_car_series_200.json
   ${car_series_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_series_id]}
   set global variable   ${car_series_id}

Get Admin car series Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series   &{kwargs}
   expect status is 422  ${resp}  

Put Admin car series By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin car series by car series id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin car series By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin car series by car series id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin car series By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin car series by car series id  &{kwargs}
   expect status is 404  ${resp}  

Put Admin car series By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin car series by car series id  &{kwargs}
   expect status is 422  ${resp}  

Patch Admin car series By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car series by car series id  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin car series By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car series by car series id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin car series By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car series by car series id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin car series By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car series by car series id  &{kwargs}
   expect status is 422  ${resp}  

