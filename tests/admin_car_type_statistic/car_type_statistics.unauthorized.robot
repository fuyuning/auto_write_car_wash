*** Settings ***
Documentation  admin_car_type_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_type_statistic.CarTypeStatisticLibrary
Force Tags  model:admin_car_type_statistic  虾洗后台


*** Test Cases ***
get admin car type statistics Fail Without Login
   [Documentation]  接口名:车型统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin car type statistics fail 403


*** Keywords ***
get admin car type statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car type statistics  &{kwargs}
   expect status is 403  ${resp}  

