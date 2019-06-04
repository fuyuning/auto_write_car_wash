*** Settings ***
Documentation  admin_wash_user_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_statistic.WashUserStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user_statistic  虾洗后台


*** Test Cases ***
get admin wash user statistics Success 
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUserStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  user_id=${user_id}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin wash user statistics success 200   ${essential_params}  ${unessential_params}

get admin wash user statistics Fail With Wrong Params
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  user_id=${user_id_422}  order_by=${order_by_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin wash user statistics fail 422   ${essential_params}  ${unessential_params}  success=False

patch admin wash user statistics visible by wash user statistic id Fail With Wrong Url
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin wash user statistics visible by wash user statistic id fail 404     wash_user_statistic_id=${wrong_url_id}  visible=False    

patch admin wash user statistics visible by wash user statistic id Success 
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  visible=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash user statistics visible by wash user statistic id success 204   ${essential_params}  ${unessential_params}    wash_user_statistic_id=${wash_user_statistic_id}

patch admin wash user statistics visible by wash user statistic id Fail With Wrong Params
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  visible=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin wash user statistics visible by wash user statistic id fail 422   ${essential_params}  ${unessential_params}    wash_user_statistic_id=${wash_user_statistic_id}  success=False


*** Variables ***
${wash_user_statistic_id}  


*** Keywords ***
get admin wash user statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user statistics  &{kwargs}
   expect status is 200  ${resp}  admin_wash_user_statistic/get_admin_wash_user_statistics_200.json
   ${wash_user_statistic_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_user_statistic_id']}
   set global variable   ${wash_user_statistic_id}

get admin wash user statistics Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user statistics  &{kwargs}
   expect status is 422  ${resp}  

patch admin wash user statistics visible by wash user statistic id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash user statistics visible by wash user statistic id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash user statistics visible by wash user statistic id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash user statistics visible by wash user statistic id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash user statistics visible by wash user statistic id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash user statistics visible by wash user statistic id  &{kwargs}
   expect status is 422  ${resp}  

