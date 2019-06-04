*** Settings ***
Documentation  admin_car_series
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series.CarSeriesLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_series  虾洗后台


*** Test Cases ***
get admin car series Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarSeries 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_brand=${car_brand}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  is_active=False  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin car series success 200   ${essential_params}  ${unessential_params}

get admin car series Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_brand=${car_brand_422}  car_series_name=${car_series_name_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  is_active=ThisIsRobot!  is_car_model=ThisIsRobot!  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin car series fail 422   ${essential_params}  ${unessential_params}  success=False

put admin car series by car series id Success 
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  car_model_id=${car_model_id}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin car series by car series id success 204   ${essential_params}  ${unessential_params}    car_series_id=${car_series_id}

put admin car series by car series id Fail With Wrong Url
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin car series by car series id fail 404     car_series_id=${wrong_url_id}  car_model_id=${car_model_id}    

put admin car series by car series id Fail With Wrong Params
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_model_id=${car_model_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin car series by car series id fail 422   ${essential_params}  ${unessential_params}    car_series_id=${car_series_id}  success=False

patch admin car series by car series id Success 
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  is_active=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin car series by car series id success 204   ${essential_params}  ${unessential_params}    car_series_id=${car_series_id}

patch admin car series by car series id Fail With Wrong Url
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin car series by car series id fail 404     car_series_id=${wrong_url_id}  is_active=False    

patch admin car series by car series id Fail With Wrong Params
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  is_active=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin car series by car series id fail 422   ${essential_params}  ${unessential_params}    car_series_id=${car_series_id}  success=False


*** Variables ***
${car_series_id}  


*** Keywords ***
get admin car series Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series  &{kwargs}
   expect status is 200  ${resp}  admin_car_series/get_admin_car_series_200.json
   ${car_series_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['car_series_id']}
   set global variable   ${car_series_id}

get admin car series Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series  &{kwargs}
   expect status is 422  ${resp}  

put admin car series by car series id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin car series by car series id  &{kwargs}
   expect status is 204  ${resp}  

put admin car series by car series id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin car series by car series id  &{kwargs}
   expect status is 404  ${resp}  

put admin car series by car series id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin car series by car series id  &{kwargs}
   expect status is 422  ${resp}  

patch admin car series by car series id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car series by car series id  &{kwargs}
   expect status is 204  ${resp}  

patch admin car series by car series id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car series by car series id  &{kwargs}
   expect status is 404  ${resp}  

patch admin car series by car series id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car series by car series id  &{kwargs}
   expect status is 422  ${resp}  

