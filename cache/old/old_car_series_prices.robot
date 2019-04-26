*** Settings ***
Documentation  admin_car_series_price
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series_price.CarSeriesPriceLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_series_price  虾洗后台


*** Test Cases ***
Get Admin Car Series Prices Success 
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 car_series_price 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  intelligent_service_id=${intelligent_service_id}  
   ${unessential_params}  create list  car_brand_name=${car_brand_name}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Series Prices Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Series Prices Fail With Wrong Params
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  intelligent_service_id=${intelligent_service_id_422}  
   ${unessential_params}  create list  car_brand_name=${car_brand_name_422}  car_series_name=${car_series_name_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Car Series Prices Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Admin Car Series Prices Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Series Prices   &{kwargs}
   expect status is 200  ${resp}  admin_car_series_price/Get_Admin_Car_Series_Prices_200.json

Get Admin Car Series Prices Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Series Prices   &{kwargs}
   expect status is 422  ${resp}  

