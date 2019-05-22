*** Settings ***
Documentation  admin_parking_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_statistic.ParkingStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_parking_statistic  虾洗后台


*** Test Cases ***
get admin parking statistics by day Success 
   [Documentation]  接口名:停车场统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 ParkingStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin parking statistics by day Success 200  ${essential_params}  ${unessential_params}

get admin parking statistics by day Fail With Wrong Params
   [Documentation]  接口名:停车场统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by_422}  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin parking statistics by day Fail 422  ${essential_params}  ${unessential_params}  success=False

patch admin parking statistics by day visible by parking statistic id Fail With Wrong Url
   [Documentation]  接口名:停车场数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  patch admin parking statistics by day visible by parking statistic id Fail 404  ${essential_params}  ${unessential_params}    parking_statistic_id=${wrong_url_id}

patch admin parking statistics by day visible by parking statistic id Success 
   [Documentation]  接口名:停车场数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  patch admin parking statistics by day visible by parking statistic id Success 204  ${essential_params}  ${unessential_params}    parking_statistic_id=${parking_statistic_id}

patch admin parking statistics by day visible by parking statistic id Fail With Wrong Params
   [Documentation]  接口名:停车场数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  visible=ThisIsRobot!  
   ${unessential_params}  create list  
   run every case by params  patch admin parking statistics by day visible by parking statistic id Fail 422  ${essential_params}  ${unessential_params}    parking_statistic_id=${parking_statistic_id}  success=False


*** Variables ***
${parking_statistic_id}  


*** Keywords ***
get admin parking statistics by day Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking statistics by day  &{kwargs}
   expect status is 200  ${resp}  admin_parking_statistic/get_admin_parking_statistics_by_day_200.json
   ${parking_statistic_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][parking_statistic_id]}
   set global variable   ${parking_statistic_id}

get admin parking statistics by day Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking statistics by day  &{kwargs}
   expect status is 422  ${resp}  

patch admin parking statistics by day visible by parking statistic id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parking statistics by day visible by parking statistic id  &{kwargs}
   expect status is 404  ${resp}  

patch admin parking statistics by day visible by parking statistic id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parking statistics by day visible by parking statistic id  &{kwargs}
   expect status is 204  ${resp}  

patch admin parking statistics by day visible by parking statistic id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parking statistics by day visible by parking statistic id  &{kwargs}
   expect status is 422  ${resp}  

