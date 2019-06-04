*** Settings ***
Documentation  app_car_washer_order_statistic
Resource  ../resources.robot
Library  robot_washing_expert_library.car_washer_order_statistic.CarWasherOrderStatisticLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_washer_order_statistic  虾客APP


*** Test Cases ***
get car wash car washers order statistic Success 
   [Documentation]  接口名:虾克接单统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    get car wash car washers order statistic success 200


*** Keywords ***
get car wash car washers order statistic Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car washers order statistic  &{kwargs}
   expect status is 200  ${resp}  app_car_washer_order_statistic/get_car_wash_car_washers_order_statistic_200.json

