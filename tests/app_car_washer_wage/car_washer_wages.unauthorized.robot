*** Settings ***
Documentation  app_car_washer_wage
Resource  ../resources.robot
Library  robot_washing_expert_library.car_washer_wage.CarWasherWageLibrary
Force Tags  model:app_car_washer_wage  虾客APP


*** Test Cases ***
get car wash car washer wage achievement Fail Without Login
   [Documentation]  接口名:考核成绩${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get car wash car washer wage achievement fail 403


*** Keywords ***
get car wash car washer wage achievement Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car washer wage achievement  &{kwargs}
   expect status is 403  ${resp}  

