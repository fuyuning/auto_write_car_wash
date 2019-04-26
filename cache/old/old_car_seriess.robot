*** Settings ***
Documentation  wxmp_car_series
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_series.CarSeriesLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_car_series  车主微信端


*** Test Cases ***
Get Car Series Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarSeries 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  brand_id=${brand_id}  car_series_name=${car_series_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Car Series Success 200  ${essential_params}  ${unessential_params}

Get Car Series Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  brand_id=${brand_id_422}  car_series_name=${car_series_name_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Car Series Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Car Series Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Car Series   &{kwargs}
   expect status is 200  ${resp}  wxmp_car_series/Get_Car_Series_200.json

Get Car Series Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Car Series   &{kwargs}
   expect status is 422  ${resp}  

