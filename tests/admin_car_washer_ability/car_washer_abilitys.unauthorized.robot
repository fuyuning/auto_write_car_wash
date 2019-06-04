*** Settings ***
Documentation  admin_car_washer_ability
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_ability.CarWasherAbilityLibrary
Force Tags  model:admin_car_washer_ability  虾洗后台


*** Test Cases ***
get admin car washer ability Fail Without Login
   [Documentation]  接口名:获取虾客能力值${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin car washer ability fail 403

put admin car washer ability Fail Without Login
   [Documentation]  接口名:设置虾客能力值${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin car washer ability fail 403   ability_value=${ability_value}    


*** Keywords ***
get admin car washer ability Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer ability  &{kwargs}
   expect status is 403  ${resp}  

put admin car washer ability Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin car washer ability  &{kwargs}
   expect status is 403  ${resp}  

