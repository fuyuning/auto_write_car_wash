*** Settings ***
Documentation  app_car_washer_wage
Resource  ../resources.robot
Library  robot_washing_expert_library.car_washer_wage.CarWasherWageLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_washer_wage  虾客APP


*** Test Cases ***
get car wash car washer wage achievement Success 
   [Documentation]  接口名:考核成绩${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasherWage 列表。
   [Tags]           Respcode:200
    get car wash car washer wage achievement success 200


*** Keywords ***
get car wash car washer wage achievement Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car washer wage achievement  &{kwargs}
   expect status is 200  ${resp}  app_car_washer_wage/get_car_wash_car_washer_wage_achievement_200.json

