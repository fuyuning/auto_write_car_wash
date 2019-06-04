*** Settings ***
Documentation  wxmp_user_car
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.user_car.UserCarLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_user_car  车主微信端


*** Test Cases ***
post user user cars Success 
   [Documentation]  接口名:添加车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  car_id=${car_id}  car_brand_id=${car_brand_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create dictionary  car_series=${car_series}  car_brand=${car_brand}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  
   run every case by params   post user user cars success 201   ${essential_params}  ${unessential_params}

post user user cars Fail With Wrong Params
   [Documentation]  接口名:添加车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_id=${car_id_422}  car_brand_id=${car_brand_id_422}  car_series_id=${car_series_id_422}  
   ${unessential_params}  create dictionary  car_series=${car_series_422}  car_brand=${car_brand_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  car_model_id=${car_model_id_422}  
   run every case by params   post user user cars fail 422   ${essential_params}  ${unessential_params}  success=False

get user user cars by user car id Success 
   [Documentation]  接口名:更改车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserCar 对象。
   [Tags]           Respcode:200
   get user user cars by user car id success 200     user_car_id=${user_car_id}

get user user cars by user car id Fail With Wrong Url
   [Documentation]  接口名:更改车辆信息查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get user user cars by user car id fail 404     user_car_id=${wrong_url_id}

get user user cars Success 
   [Documentation]  接口名:查询车辆信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 UserCar 列表。
   [Tags]           Respcode:200
    get user user cars success 200

put user user cars by user car id Success 
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  car_id=${car_id}  brand_id=${brand_id}  car_series_id=${car_series_id}  
   ${unessential_params}  create dictionary  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  
   run every case by params   put user user cars by user car id success 204   ${essential_params}  ${unessential_params}    user_car_id=${user_car_id}

put user user cars by user car id Fail With Wrong Url
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put user user cars by user car id fail 404     user_car_id=${wrong_url_id}  car_id=${car_id}  brand_id=${brand_id}  car_series_id=${car_series_id}    car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  car_model_id=${car_model_id}  

put user user cars by user car id Fail With Wrong Params
   [Documentation]  接口名:更改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_id=${car_id_422}  brand_id=${brand_id_422}  car_series_id=${car_series_id_422}  
   ${unessential_params}  create dictionary  car_brand=${car_brand_422}  car_series=${car_series_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  car_model_id=${car_model_id_422}  
   run every case by params   put user user cars by user car id fail 422   ${essential_params}  ${unessential_params}    user_car_id=${user_car_id}  success=False

put user user cars is default by user car id Success 
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   put user user cars is default by user car id success 204     user_car_id=${user_car_id}

put user user cars is default by user car id Fail With Wrong Url
   [Documentation]  接口名:设置默认联系方式${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put user user cars is default by user car id fail 404     user_car_id=${wrong_url_id}

delete user user cars by user car id Fail With Wrong Url
   [Documentation]  接口名:删除车辆信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete user user cars by user car id fail 404     user_car_id=${wrong_url_id}

delete user user cars by user car id Success 
   [Documentation]  接口名:删除车辆信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete user user cars by user car id success 204     user_car_id=${user_car_id}


*** Variables ***
${user_car_id}  


*** Keywords ***
post user user cars Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post user user cars  &{kwargs}
   expect status is 201  ${resp}  wxmp_user_car/post_user_user_cars_201.json
   ${user_car_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['user_car_id']}
   set global variable   ${user_car_id}

post user user cars Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user user cars  &{kwargs}
   expect status is 422  ${resp}  

get user user cars by user car id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user user cars by user car id  &{kwargs}
   expect status is 200  ${resp}  wxmp_user_car/get_user_user_cars_by_user_car_id_200.json
   ${user_car_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['user_car_id']}
   set global variable   ${user_car_id}

get user user cars by user car id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user user cars by user car id  &{kwargs}
   expect status is 404  ${resp}  

get user user cars Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user user cars  &{kwargs}
   expect status is 200  ${resp}  wxmp_user_car/get_user_user_cars_200.json
   ${user_car_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['user_car_id']}
   set global variable   ${user_car_id}

put user user cars by user car id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put user user cars by user car id  &{kwargs}
   expect status is 204  ${resp}  

put user user cars by user car id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put user user cars by user car id  &{kwargs}
   expect status is 404  ${resp}  

put user user cars by user car id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put user user cars by user car id  &{kwargs}
   expect status is 422  ${resp}  

put user user cars is default by user car id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put user user cars is default by user car id  &{kwargs}
   expect status is 204  ${resp}  

put user user cars is default by user car id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put user user cars is default by user car id  &{kwargs}
   expect status is 404  ${resp}  

delete user user cars by user car id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete user user cars by user car id  &{kwargs}
   expect status is 404  ${resp}  

delete user user cars by user car id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete user user cars by user car id  &{kwargs}
   expect status is 204  ${resp}  

