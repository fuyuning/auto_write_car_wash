*** Settings ***
Documentation  admin_car_model
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_model.CarModelLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_model  虾洗后台


*** Test Cases ***
Get car_model Fail Without Login
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car models Fail 403  ${essential_params}  ${unessential_params}



Get car_model Success 
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarModel 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car models Success 200  ${essential_params}  ${unessential_params}



Get car_model Fail With Wrong Params
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car models Fail 422  ${essential_params}  ${unessential_params}



Get car_model By Id Fail With Wrong Url
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin car models By Id Fail 404  car_model_id=${wrong_url_id}



Get car_model By Id Fail Without Login
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin car models By Id Fail 403  car_model_id=${car_model_id}



Get car_model By Id Success 
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarModel 对象。
   [Tags]           Respcode:200
   Get admin car models By Id Success 200  car_model_id=${car_model_id}



Get car_model Fail Without Login
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  Get admin car model count Fail 403  ${essential_params}  ${unessential_params}



Get car_model Success 
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  Get admin car model count Success 200  ${essential_params}  ${unessential_params}



Get car_model Fail With Wrong Params
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  Get admin car model count Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***
${car_model_id}


*** Keywords ***
Get Admin car models Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models   &{kwargs}
   expect status is 403  ${resp}  

Get Admin car models Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models   &{kwargs}
   expect status is 200  ${resp}  admin_car_model/Get_Admin_car_models_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

Get Admin car models Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models   &{kwargs}
   expect status is 422  ${resp}  

Get Admin car models By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models by car model id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin car models By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models by car model id  &{kwargs}
   expect status is 403  ${resp}  

Get Admin car models By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models by car model id  &{kwargs}
   expect status is 200  ${resp}  admin_car_model/Get_Admin_car_models_By_Id_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

Get Admin car model count Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car model count   &{kwargs}
   expect status is 403  ${resp}  

Get Admin car model count Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car model count   &{kwargs}
   expect status is 200  ${resp}  admin_car_model/Get_Admin_car_model_count_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

Get Admin car model count Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car model count   &{kwargs}
   expect status is 422  ${resp}  

