*** Settings ***
Documentation  admin_car_series_price
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series_price.CarSeriesPriceLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_series_price  虾洗后台


*** Test Cases ***
Get car_series_price Fail Without Login
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  intelligent_service_id=${intelligent_service_id}  
   ${unessential_params}  create list  car_brand_name=${car_brand_name}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car series prices Fail 403  ${essential_params}  ${unessential_params}



Get car_series_price Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 car_series_price 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  intelligent_service_id=${intelligent_service_id}  
   ${unessential_params}  create list  car_brand_name=${car_brand_name}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car series prices Success 200  ${essential_params}  ${unessential_params}



Get car_series_price Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  intelligent_service_id=${intelligent_service_id}  
   ${unessential_params}  create list  car_brand_name=${car_brand_name}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car series prices Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Admin car series prices Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series prices   &{kwargs}
   expect status is 403  ${resp}  

Get Admin car series prices Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series prices   &{kwargs}
   expect status is 200  ${resp}  admin_car_series_price/Get_Admin_car_series_prices_200.json

Get Admin car series prices Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series prices   &{kwargs}
   expect status is 422  ${resp}  

