*** Settings ***
Documentation  wxmp_car_series
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_series.CarSeriesLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_car_series  车主微信端


*** Test Cases ***
Get car_series Fail Without Login
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  brand_id=${brand_id}  car_series_name=${car_series_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get car series Fail 403  ${essential_params}  ${unessential_params}



Get car_series Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarSeries 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  brand_id=${brand_id}  car_series_name=${car_series_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get car series Success 200  ${essential_params}  ${unessential_params}



Get car_series Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  brand_id=${brand_id}  car_series_name=${car_series_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get car series Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Car series Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car series   &{kwargs}
   expect status is 403  ${resp}  

Get Car series Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car series   &{kwargs}
   expect status is 200  ${resp}  wxmp_car_series/Get_Car_series_200.json

Get Car series Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car series   &{kwargs}
   expect status is 422  ${resp}  

