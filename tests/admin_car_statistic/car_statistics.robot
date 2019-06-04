*** Settings ***
Documentation  admin_car_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_statistic.CarStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_statistic  虾洗后台


*** Test Cases ***
get admin car statistics Success 
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id}  last_section=${last_section}  order_by=${order_by}  wash_area_id=${wash_area_id}  parking_id=${parking_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin car statistics success 200   ${essential_params}  ${unessential_params}

get admin car statistics Fail With Wrong Params
   [Documentation]  接口名:车辆统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  car_id=${car_id_422}  last_section=${last_section_422}  order_by=${order_by_422}  wash_area_id=${wash_area_id_422}  parking_id=${parking_id_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin car statistics fail 422   ${essential_params}  ${unessential_params}  success=False

patch admin car statistics visible by car statistic id Fail With Wrong Url
   [Documentation]  接口名:车辆统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin car statistics visible by car statistic id fail 404     car_statistic_id=${wrong_url_id}  visible=False    

patch admin car statistics visible by car statistic id Success 
   [Documentation]  接口名:车辆统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  visible=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin car statistics visible by car statistic id success 204   ${essential_params}  ${unessential_params}    car_statistic_id=${car_statistic_id}

patch admin car statistics visible by car statistic id Fail With Wrong Params
   [Documentation]  接口名:车辆统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  visible=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin car statistics visible by car statistic id fail 422   ${essential_params}  ${unessential_params}    car_statistic_id=${car_statistic_id}  success=False


*** Variables ***
${car_statistic_id}  


*** Keywords ***
get admin car statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car statistics  &{kwargs}
   expect status is 200  ${resp}  admin_car_statistic/get_admin_car_statistics_200.json
   ${car_statistic_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['car_statistic_id']}
   set global variable   ${car_statistic_id}

get admin car statistics Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car statistics  &{kwargs}
   expect status is 422  ${resp}  

patch admin car statistics visible by car statistic id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car statistics visible by car statistic id  &{kwargs}
   expect status is 404  ${resp}  

patch admin car statistics visible by car statistic id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car statistics visible by car statistic id  &{kwargs}
   expect status is 204  ${resp}  

patch admin car statistics visible by car statistic id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car statistics visible by car statistic id  &{kwargs}
   expect status is 422  ${resp}  

