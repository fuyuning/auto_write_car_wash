*** Settings ***
Documentation  admin_car_type_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_type_statistic.CarTypeStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_type_statistic  虾洗后台


*** Test Cases ***
get admin car type statistics Success 
   [Documentation]  接口名:车型统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get admin car type statistics success 200


*** Keywords ***
get admin car type statistics Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car type statistics  &{kwargs}
   expect status is 200  ${resp}  admin_car_type_statistic/get_admin_car_type_statistics_200.json

