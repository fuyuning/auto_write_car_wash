*** Settings ***
Documentation  wxmp_user_car
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_car.UserCarLibrary
Force Tags  model:wxmp_user_car  车主微信端


*** Test Cases ***
Post User User Cars Fail Without Login
   [Documentation]  接口名:添加车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  car_brand_id=${car_brand_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create list  car_series=${car_series}  car_brand=${car_brand}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  
   run every case by params  Post User User Cars Fail 403  ${essential_params}  ${unessential_params}

Get User User Cars By User Car Id Fail Without Login
   [Documentation]  接口名:更改车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get User User Cars By User Car Id Fail 403  user_car_id=${user_car_id}

Get User User Cars Fail Without Login
   [Documentation]  接口名:查询车辆信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get User User Cars Fail 403

Put User User Cars By User Car Id Fail Without Login
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  brand_id=${brand_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  
   run every case by params  Put User User Cars By User Car Id Fail 403  ${essential_params}  ${unessential_params}  user_car_id=${user_car_id}

Put is Default by user car id Fail Without Login
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Put is Default by user car id Fail 403  user_car_id/is_default=${user_car_id/is_default}

Delete User User Cars By User Car Id Fail Without Login
   [Documentation]  接口名:删除车辆信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete User User Cars By User Car Id Fail 403  user_car_id=${user_car_id}


*** Variables ***
${user_car_id}  12345678909876543
${user_car_id/is_default}  12345678909876543


*** Keywords ***
Post User User Cars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Cars   &{kwargs}
   expect status is 403  ${resp}  

Get User User Cars By User Car Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Cars By User Car Id   &{kwargs}
   expect status is 403  ${resp}  

Get User User Cars Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Cars   &{kwargs}
   expect status is 403  ${resp}  

Put User User Cars By User Car Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Cars By User Car Id   &{kwargs}
   expect status is 403  ${resp}  

Put is Default by user car id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put is Default by user car id   &{kwargs}
   expect status is 403  ${resp}  

Delete User User Cars By User Car Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete User User Cars By User Car Id   &{kwargs}
   expect status is 403  ${resp}  

