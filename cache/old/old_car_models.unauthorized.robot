*** Settings ***
Documentation  admin_car_model
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_model.CarModelLibrary
Force Tags  model:admin_car_model  虾洗后台


*** Test Cases ***
Get Admin Car Models Fail Without Login
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Models Fail 403  ${essential_params}  ${unessential_params}

Get Admin Car Models By Car Model Id Fail Without Login
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Car Models By Car Model Id Fail 403  car_model_id=${car_model_id}

Get Admin Car Model Count Fail Without Login
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  Get Admin Car Model Count Fail 403  ${essential_params}  ${unessential_params}


*** Variables ***
${car_model_id}  12345678909876543


*** Keywords ***
Get Admin Car Models Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Models   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Car Models By Car Model Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Models By Car Model Id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Car Model Count Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Model Count   &{kwargs}
   expect status is 403  ${resp}  

