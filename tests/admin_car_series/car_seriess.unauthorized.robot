*** Settings ***
Documentation  admin_car_series
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_series.CarSeriesLibrary
Force Tags  model:admin_car_series  虾洗后台


*** Test Cases ***
Get Admin Car Series Fail Without Login
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series_name=${car_series_name}  car_scale=${car_scale}  car_model=${car_model}  is_active=False  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Series Fail 403  ${essential_params}  ${unessential_params}

Put Admin Car Series By Car Series Id Fail Without Login
   [Documentation]  接口名:编辑车系${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_model_id=${car_model_id}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Car Series By Car Series Id Fail 403  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}

Patch Admin Car Series By Car Series Id Fail Without Login
   [Documentation]  接口名:启用/禁用服务支持${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  is_active=False  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Car Series By Car Series Id Fail 403  ${essential_params}  ${unessential_params}  car_series_id=${car_series_id}


*** Variables ***
${car_series_id}


*** Keywords ***
Get Admin Car Series Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Series   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Car Series By Car Series Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Series By Car Series Id   &{kwargs}
   expect status is 403  ${resp}  

Patch Admin Car Series By Car Series Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Car Series By Car Series Id   &{kwargs}
   expect status is 403  ${resp}  

