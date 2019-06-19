*** Settings ***
Documentation  app_car_series
Resource  ../resources.robot
Library  robot_washing_expert_library.car_series.CarSeriesLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_series  虾客APP


*** Test Cases ***
get car wash car series Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarSeries 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  brand_id=${brand_id}  car_series_name=${car_series_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get car wash car series success 200   ${essential_params}  ${unessential_params}

get car wash car series Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  brand_id=${brand_id_422}  car_series_name=${car_series_name_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get car wash car series fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash car series money Fail With Wrong Params
   [Documentation]  接口名:车系算钱${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  parking_id=${parking_id_422}  
   ${unessential_params}  create dictionary  series_id=${series_id_422}  
   run every case by params   get car wash car series money fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash car series money Success 
   [Documentation]  接口名:车系算钱${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  parking_id=${parking_id}  
   ${unessential_params}  create dictionary  series_id=${series_id}  
   run every case by params   get car wash car series money success 200   ${essential_params}  ${unessential_params}


*** Keywords ***
get car wash car series Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car series  &{kwargs}
   expect status is 200  ${resp}  app_car_series/get_car_wash_car_series_200.json

get car wash car series Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car series  &{kwargs}
   expect status is 422  ${resp}  

get car wash car series money Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car series money  &{kwargs}
   expect status is 422  ${resp}  

get car wash car series money Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car series money  &{kwargs}
   expect status is 200  ${resp}  app_car_series/get_car_wash_car_series_money_200.json

