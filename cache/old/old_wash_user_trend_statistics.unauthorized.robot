*** Settings ***
Documentation  admin_wash_user_trend_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_user_trend_statistic.WashUserTrendStatisticLibrary
Force Tags  model:admin_wash_user_trend_statistic  虾洗后台


*** Test Cases ***
get admin wash user trend statistics by day Fail Without Login
   [Documentation]  接口名:用户趋势统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin wash user trend statistics by day Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
get admin wash user trend statistics by day Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash user trend statistics by day  &{kwargs}
   expect status is 403  ${resp}  

