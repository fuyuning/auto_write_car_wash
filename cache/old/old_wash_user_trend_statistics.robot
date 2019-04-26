*** Settings ***
Documentation  admin_wash_user_trend_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_trend_statistic.WashUserTrendStatisticLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_user_trend_statistic  虾洗后台


*** Test Cases ***
Get Admin Wash User Trend Statistics By Day Success 
   [Documentation]  接口名:用户趋势统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashUserTrendStatistic 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash User Trend Statistics By Day Success 200  ${essential_params}  ${unessential_params}

Get Admin Wash User Trend Statistics By Day Fail With Wrong Params
   [Documentation]  接口名:用户趋势统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by_422}  section=${section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  Get Admin Wash User Trend Statistics By Day Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Admin Wash User Trend Statistics By Day Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash User Trend Statistics By Day   &{kwargs}
   expect status is 200  ${resp}  admin_wash_user_trend_statistic/Get_Admin_Wash_User_Trend_Statistics_By_Day_200.json

Get Admin Wash User Trend Statistics By Day Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash User Trend Statistics By Day   &{kwargs}
   expect status is 422  ${resp}  

