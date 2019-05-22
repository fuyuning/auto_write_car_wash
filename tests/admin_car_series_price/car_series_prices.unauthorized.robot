*** Settings ***
Documentation  admin_car_series_price
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series_price.CarSeriesPriceLibrary
Force Tags  model:admin_car_series_price  虾洗后台


*** Test Cases ***
get admin car series prices Fail Without Login
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  intelligent_service_id=${intelligent_service_id}  
   ${unessential_params}  create list  car_brand_name=${car_brand_name}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car series prices Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
get admin car series prices Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car series prices  &{kwargs}
   expect status is 403  ${resp}  

