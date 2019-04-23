*** Settings ***
Documentation  admin_wash_user_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_statistic.WashUserStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user_statistic  虾洗后台


*** Test Cases ***
Get wash_user_statistic Fail Without Login
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash user statistics Fail 403  ${essential_params}  ${unessential_params}



Get wash_user_statistic Success 
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUserStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash user statistics Success 200  ${essential_params}  ${unessential_params}



Get wash_user_statistic Fail With Wrong Params
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  user_id=${user_id}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash user statistics Fail 422  ${essential_params}  ${unessential_params}



Patch wash_user_statistic By Id Fail With Wrong Url
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash user statistics By Id Fail 404  ${essential_params}  ${unessential_params}  wash_user_statistic_id/visible=${wrong_url_id}



Patch wash_user_statistic By Id Fail Without Login
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash user statistics By Id Fail 403  ${essential_params}  ${unessential_params}  wash_user_statistic_id/visible=${wash_user_statistic_id/visible}



Patch wash_user_statistic By Id Success 
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash user statistics By Id Success 204  ${essential_params}  ${unessential_params}  wash_user_statistic_id/visible=${wash_user_statistic_id/visible}



Patch wash_user_statistic By Id Fail With Wrong Params
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash user statistics By Id Fail 422  ${essential_params}  ${unessential_params}  wash_user_statistic_id/visible=${wash_user_statistic_id/visible}



*** Variables ***
${wash_user_statistic_id/visible}


*** Keywords ***
Get Admin wash user statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user statistics   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash user statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user statistics   &{kwargs}
   expect status is 200  ${resp}  admin_wash_user_statistic/Get_Admin_wash_user_statistics_200.json
   ${wash_user_statistic_id/visible}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_user_statistic_id/visible]}
   set global variable   ${wash_user_statistic_id/visible}

Get Admin wash user statistics Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user statistics   &{kwargs}
   expect status is 422  ${resp}  

Patch Admin wash user statistics By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch visible by wash user statistic id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin wash user statistics By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch visible by wash user statistic id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash user statistics By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch visible by wash user statistic id  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin wash user statistics By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch visible by wash user statistic id  &{kwargs}
   expect status is 422  ${resp}  

