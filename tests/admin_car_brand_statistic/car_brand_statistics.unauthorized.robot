*** Settings ***
Documentation  admin_car_brand_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_brand_statistic.CarBrandStatisticLibrary
Force Tags  model:admin_car_brand_statistic  虾洗后台


*** Test Cases ***
get admin car brand statistics Fail Without Login
   [Documentation]  接口名:车型统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car brand statistics fail 403     order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get admin car brand statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car brand statistics  &{kwargs}
   expect status is 403  ${resp}  

