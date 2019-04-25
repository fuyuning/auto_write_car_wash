*** Settings ***
Documentation  app_wash_tag
Resource  ../resources.robot
Library  robot_car_wash_app_library.wash_tag.WashTagLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_wash_tag  虾客APP


*** Test Cases ***
Get car Wash wash tags Success 
   [Documentation]  接口名:获取wash_tags列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashTag 列表。
   [Tags]           Respcode:200
    Get car Wash wash tags Success 200


*** Keywords ***
Get car Wash wash tags Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash wash tags   &{kwargs}
   expect status is 200  ${resp}  app_wash_tag/Get_car_Wash_wash_tags_200.json

