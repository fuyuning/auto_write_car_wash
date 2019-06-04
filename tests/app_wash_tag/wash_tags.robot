*** Settings ***
Documentation  app_wash_tag
Resource  ../resources.robot
Library  robot_washing_expert_library.wash_tag.WashTagLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_wash_tag  虾客APP


*** Test Cases ***
get car wash wash tags Success 
   [Documentation]  接口名:获取wash_tags列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashTag 列表。
   [Tags]           Respcode:200
    get car wash wash tags success 200


*** Keywords ***
get car wash wash tags Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash tags  &{kwargs}
   expect status is 200  ${resp}  app_wash_tag/get_car_wash_wash_tags_200.json

