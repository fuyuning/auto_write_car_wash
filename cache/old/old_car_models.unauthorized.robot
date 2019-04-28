*** Settings ***
Documentation  admin_car_model
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_model.CarModelLibrary
Force Tags  model:admin_car_model  虾洗后台


*** Test Cases ***
get admin car models Fail Without Login
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car models Fail 403  ${essential_params}  ${unessential_params}

get admin car models by car model id Fail Without Login
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car models by car model id Fail 403    car_model_id=${car_model_id}

get admin car model count Fail Without Login
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  get admin car model count Fail 403  ${essential_params}  ${unessential_params}


*** Variables ***
${car_model_id}  12345678909876543


*** Keywords ***
get admin car models Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models  &{kwargs}
   expect status is 403  ${resp}  

get admin car models by car model id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models by car model id  &{kwargs}
   expect status is 403  ${resp}  

get admin car model count Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car model count  &{kwargs}
   expect status is 403  ${resp}  

