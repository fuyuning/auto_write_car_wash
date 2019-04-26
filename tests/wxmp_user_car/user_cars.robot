*** Settings ***
Documentation  wxmp_user_car
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_car.UserCarLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_user_car  车主微信端


*** Test Cases ***
Post User User Cars Success 
   [Documentation]  接口名:添加车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  car_id=${car_id}  car_brand_id=${car_brand_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create list  car_series=${car_series}  car_brand=${car_brand}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  
   run every case by params  Post User User Cars Success 201  ${essential_params}  ${unessential_params}

Post User User Cars Fail With Wrong Params
   [Documentation]  接口名:添加车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id_422}  car_brand_id=${car_brand_id_422}  car_series_id=${car_series_id_422}  
   ${unessential_params}  create list  car_series=${car_series_422}  car_brand=${car_brand_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  car_model_id=${car_model_id_422}  
   run every case by params  Post User User Cars Fail 422  ${essential_params}  ${unessential_params}

Get User User Cars By User Car Id Success 
   [Documentation]  接口名:更改车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserCar 对象。
   [Tags]           Respcode:200
   Get User User Cars By User Car Id Success 200  user_car_id=${user_car_id}

Get User User Cars By User Car Id Fail With Wrong Url
   [Documentation]  接口名:更改车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get User User Cars By User Car Id Fail 404  user_car_id=${wrong_url_id}

Get User User Cars Success 
   [Documentation]  接口名:查询车辆信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserCar 列表。
   [Tags]           Respcode:200
    Get User User Cars Success 200

Put User User Cars By User Car Id Success 
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  car_id=${car_id}  brand_id=${brand_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  
   run every case by params  Put User User Cars By User Car Id Success 204  ${essential_params}  ${unessential_params}  user_car_id=${user_car_id}

Put User User Cars By User Car Id Fail With Wrong Url
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_id=${car_id}  brand_id=${brand_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  
   run every case by params  Put User User Cars By User Car Id Fail 404  ${essential_params}  ${unessential_params}  user_car_id=${wrong_url_id}

Put User User Cars By User Car Id Fail With Wrong Params
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id_422}  brand_id=${brand_id_422}  car_series_id=${car_series_id_422}  
   ${unessential_params}  create list  car_brand=${car_brand_422}  car_series=${car_series_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  car_model_id=${car_model_id_422}  
   run every case by params  Put User User Cars By User Car Id Fail 422  ${essential_params}  ${unessential_params}  user_car_id=${user_car_id}

Put is Default by user car id Success 
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Put is Default by user car id Success 204  user_car_id/is_default=${user_car_id/is_default}

Put is Default by user car id Fail With Wrong Url
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Put is Default by user car id Fail 404  user_car_id/is_default=${wrong_url_id}

Delete User User Cars By User Car Id Fail With Wrong Url
   [Documentation]  接口名:删除车辆信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete User User Cars By User Car Id Fail 404  user_car_id=${wrong_url_id}

Delete User User Cars By User Car Id Success 
   [Documentation]  接口名:删除车辆信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete User User Cars By User Car Id Success 204  user_car_id=${user_car_id}


*** Variables ***
${user_car_id}  
${user_car_id/is_default}  


*** Keywords ***
Post User User Cars Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Cars   &{kwargs}
   expect status is 201  ${resp}  wxmp_user_car/Post_User_User_Cars_201.json
   ${user_car_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_car_id]}
   set global variable   ${user_car_id}
   ${user_car_id/is_default}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_car_id/is_default]}
   set global variable   ${user_car_id/is_default}

Post User User Cars Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User User Cars   &{kwargs}
   expect status is 422  ${resp}  

Get User User Cars By User Car Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Cars By User Car Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_user_car/Get_User_User_Cars_By_User_Car_Id_200.json
   ${user_car_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_car_id]}
   set global variable   ${user_car_id}
   ${user_car_id/is_default}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_car_id/is_default]}
   set global variable   ${user_car_id/is_default}

Get User User Cars By User Car Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Cars By User Car Id   &{kwargs}
   expect status is 404  ${resp}  

Get User User Cars Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User User Cars   &{kwargs}
   expect status is 200  ${resp}  wxmp_user_car/Get_User_User_Cars_200.json
   ${user_car_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_car_id]}
   set global variable   ${user_car_id}
   ${user_car_id/is_default}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][user_car_id/is_default]}
   set global variable   ${user_car_id/is_default}

Put User User Cars By User Car Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Cars By User Car Id   &{kwargs}
   expect status is 204  ${resp}  

Put User User Cars By User Car Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Cars By User Car Id   &{kwargs}
   expect status is 404  ${resp}  

Put User User Cars By User Car Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put User User Cars By User Car Id   &{kwargs}
   expect status is 422  ${resp}  

Put is Default by user car id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put is Default by user car id   &{kwargs}
   expect status is 204  ${resp}  

Put is Default by user car id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put is Default by user car id   &{kwargs}
   expect status is 404  ${resp}  

Delete User User Cars By User Car Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete User User Cars By User Car Id   &{kwargs}
   expect status is 404  ${resp}  

Delete User User Cars By User Car Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete User User Cars By User Car Id   &{kwargs}
   expect status is 204  ${resp}  

