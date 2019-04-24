*** Settings ***
Documentation  admin_car_model
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_model.CarModelLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_model  虾洗后台


*** Test Cases ***
Get Admin Car Models Success 
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarModel 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Models Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Models Fail With Wrong Params
   [Documentation]  接口名:车型列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Models Fail 422  ${essential_params}  ${unessential_params}

Get Admin Car Models By Car Model Id Fail With Wrong Url
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Car Models By Car Model Id Fail 404  car_model_id=${wrong_url_id}

Get Admin Car Models By Car Model Id Success 
   [Documentation]  接口名:车型详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarModel 对象。
   [Tags]           Respcode:200
   Get Admin Car Models By Car Model Id Success 200  car_model_id=${car_model_id}

Get Admin Car Model Count Success 
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  Get Admin Car Model Count Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Model Count Fail With Wrong Params
   [Documentation]  接口名:品牌车型车系统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  car_brand=${car_brand}  car_series=${car_series}  car_scale=${car_scale}  car_model=${car_model}  is_car_model=False  
   run every case by params  Get Admin Car Model Count Fail 422  ${essential_params}  ${unessential_params}


*** Variables ***
${car_model_id}  


*** Keywords ***
Get Admin Car Models Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Models   &{kwargs}
   expect status is 200  ${resp}  admin_car_model/Get_Admin_Car_Models_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

Get Admin Car Models Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Models   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Car Models By Car Model Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Models By Car Model Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Car Models By Car Model Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Models By Car Model Id   &{kwargs}
   expect status is 200  ${resp}  admin_car_model/Get_Admin_Car_Models_By_Car_Model_Id_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

Get Admin Car Model Count Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Model Count   &{kwargs}
   expect status is 200  ${resp}  admin_car_model/Get_Admin_Car_Model_Count_200.json
   ${car_model_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_model_id]}
   set global variable   ${car_model_id}

Get Admin Car Model Count Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Model Count   &{kwargs}
   expect status is 422  ${resp}  

