*** Settings ***
Documentation  admin_car_model
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_model.CarModelLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_model  虾洗后台


*** Test Cases ***
get admin car models Success 
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarModel 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car models Success 200  ${essential_params}  ${unessential_params}

get admin car models Fail With Wrong Params
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand_422}  car_series=${car_series_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  is_car_model=ThisIsRobot!  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin car models Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin car models by car model id Fail With Wrong Url
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin car models by car model id Fail 404    car_model_id=${wrong_url_id}

get admin car models by car model id Success 
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarModel 对象。
   [Tags]           Respcode:200
   get admin car models by car model id Success 200    car_model_id=${car_model_id}

get admin car model count Success 
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  get admin car model count Success 200  ${essential_params}  ${unessential_params}

get admin car model count Fail With Wrong Params
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand_422}  car_series=${car_series_422}  car_scale=${car_scale_422}  car_model=${car_model_422}  is_car_model=ThisIsRobot!  
   run every case by params  get admin car model count Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Variables ***
${car_model_id}  


*** Keywords ***
get admin car models Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models  &{kwargs}
   expect status is 200  ${resp}  admin_car_model/get_admin_car_models_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

get admin car models Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models  &{kwargs}
   expect status is 422  ${resp}  

get admin car models by car model id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models by car model id  &{kwargs}
   expect status is 404  ${resp}  

get admin car models by car model id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car models by car model id  &{kwargs}
   expect status is 200  ${resp}  admin_car_model/get_admin_car_models_by_car_model_id_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

get admin car model count Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car model count  &{kwargs}
   expect status is 200  ${resp}  admin_car_model/get_admin_car_model_count_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

get admin car model count Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car model count  &{kwargs}
   expect status is 422  ${resp}  

