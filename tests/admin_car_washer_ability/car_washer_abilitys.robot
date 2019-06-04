*** Settings ***
Documentation  admin_car_washer_ability
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_ability.CarWasherAbilityLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_car_washer_ability  虾洗后台


*** Test Cases ***
get admin car washer ability Success 
   [Documentation]  接口名:获取虾客能力值${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarWasherAbility 列表。
   [Tags]           Respcode:200
    get admin car washer ability success 200

put admin car washer ability Fail With Wrong Params
   [Documentation]  接口名:设置虾客能力值${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  ability_value=${ability_value_422}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin car washer ability fail 422   ${essential_params}  ${unessential_params}  success=False

put admin car washer ability Success 
   [Documentation]  接口名:设置虾客能力值${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  ability_value=${ability_value}  
   ${unessential_params}  create dictionary  
   run every case by params   put admin car washer ability success 204   ${essential_params}  ${unessential_params}


*** Keywords ***
get admin car washer ability Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer ability  &{kwargs}
   expect status is 200  ${resp}  admin_car_washer_ability/get_admin_car_washer_ability_200.json

put admin car washer ability Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin car washer ability  &{kwargs}
   expect status is 422  ${resp}  

put admin car washer ability Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin car washer ability  &{kwargs}
   expect status is 204  ${resp}  

