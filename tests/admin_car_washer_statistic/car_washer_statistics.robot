*** Settings ***
Documentation  admin_car_washer_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_statistic.CarWasherStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer_statistic  虾洗后台


*** Test Cases ***
get admin car washer statistics Success 
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasherStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car washer statistics Success 200  ${essential_params}  ${unessential_params}

get admin car washer statistics Fail With Wrong Params
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username_422}  mobile=${mobile_422}  section=${section_422}  order_by=${order_by_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin car washer statistics Fail 422  ${essential_params}  ${unessential_params}  success=False

patch admin car washer statistics visible by username Fail With Wrong Url
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  patch admin car washer statistics visible by username Fail 404  ${essential_params}  ${unessential_params}    username=${wrong_url_id}

patch admin car washer statistics visible by username Success 
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  patch admin car washer statistics visible by username Success 204  ${essential_params}  ${unessential_params}    username=${username}

patch admin car washer statistics visible by username Fail With Wrong Params
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  visible=ThisIsRobot!  
   ${unessential_params}  create list  
   run every case by params  patch admin car washer statistics visible by username Fail 422  ${essential_params}  ${unessential_params}    username=${username}  success=False


*** Variables ***
${username}  


*** Keywords ***
get admin car washer statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer statistics  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer_statistic/get_admin_car_washer_statistics_200.json
   ${username}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][username]}
   set global variable   ${username}

get admin car washer statistics Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer statistics  &{kwargs}
   expect status is 422  ${resp}  

patch admin car washer statistics visible by username Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washer statistics visible by username  &{kwargs}
   expect status is 404  ${resp}  

patch admin car washer statistics visible by username Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washer statistics visible by username  &{kwargs}
   expect status is 204  ${resp}  

patch admin car washer statistics visible by username Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washer statistics visible by username  &{kwargs}
   expect status is 422  ${resp}  

