*** Settings ***
Documentation  admin_car_brand_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_brand_statistic.CarBrandStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_brand_statistic  虾洗后台


*** Test Cases ***
get admin car brand statistics Success 
   [Documentation]  接口名:车型统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarBrandStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin car brand statistics success 200   ${essential_params}  ${unessential_params}

get admin car brand statistics Fail With Wrong Params
   [Documentation]  接口名:车型统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  order_by=${order_by_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin car brand statistics fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get admin car brand statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car brand statistics  &{kwargs}
   expect status is 200  ${resp}  admin_car_brand_statistic/get_admin_car_brand_statistics_200.json

get admin car brand statistics Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car brand statistics  &{kwargs}
   expect status is 422  ${resp}  

