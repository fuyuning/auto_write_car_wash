*** Settings ***
Documentation  app_wash_tag
Resource  ../resources.robot
Library  robot_car_wash_app_library.wash_tag.WashTagLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_wash_tag  虾客APP


*** Test Cases ***
Get wash_tag Success 
   [Documentation]  接口名:获取wash_tags列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashTag 列表。
   [Tags]           Respcode:200
    Get car wash wash tags Success 200


Get wash_tag Fail With Wrong Url
   [Documentation]  接口名:获取wash_tags列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get car wash wash tags Fail 404


*** Variables ***


*** Keywords ***
Get Car wash wash tags Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash tags   &{kwargs}
   expect status is 200  ${resp}  app_wash_tag/Get_Car_wash_wash_tags_200.json

Get Car wash wash tags Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash tags   &{kwargs}
   expect status is 404  ${resp}  

