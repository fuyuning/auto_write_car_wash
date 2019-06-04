*** Settings ***
Documentation  wxmp_user_car
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_car.UserCarLibrary
Force Tags  model:wxmp_user_car  车主微信端


*** Test Cases ***
post user user cars Fail Without Login
   [Documentation]  接口名:添加车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user user cars fail 403   car_id=${car_id}  car_brand_id=${car_brand_id}  car_series_id=${car_series_id}    car_series=${car_series}  car_brand=${car_brand}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  

get user user cars by user car id Fail Without Login
   [Documentation]  接口名:更改车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user user cars by user car id fail 403     user_car_id=${user_car_id}

get user user cars Fail Without Login
   [Documentation]  接口名:查询车辆信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get user user cars fail 403

put user user cars by user car id Fail Without Login
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put user user cars by user car id fail 403     user_car_id=${user_car_id}  car_id=${car_id}  brand_id=${brand_id}  car_series_id=${car_series_id}    car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  

put user user cars is default by user car id Fail Without Login
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put user user cars is default by user car id fail 403     user_car_id=${user_car_id}

delete user user cars by user car id Fail Without Login
   [Documentation]  接口名:删除车辆信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete user user cars by user car id fail 403     user_car_id=${user_car_id}


*** Variables ***
${user_car_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post user user cars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user user cars  &{kwargs}
   expect status is 403  ${resp}  

get user user cars by user car id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user user cars by user car id  &{kwargs}
   expect status is 403  ${resp}  

get user user cars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user user cars  &{kwargs}
   expect status is 403  ${resp}  

put user user cars by user car id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put user user cars by user car id  &{kwargs}
   expect status is 403  ${resp}  

put user user cars is default by user car id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put user user cars is default by user car id  &{kwargs}
   expect status is 403  ${resp}  

delete user user cars by user car id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete user user cars by user car id  &{kwargs}
   expect status is 403  ${resp}  

