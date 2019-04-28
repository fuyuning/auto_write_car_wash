*** Settings ***
Documentation  wxmp_wash_area
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_area.WashAreaLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_wash_area  车主微信端


*** Test Cases ***
get wash areas Success 
   [Documentation]  接口名:获取洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashArea 列表。
   [Tags]           Respcode:200
    get wash areas Success 200


*** Keywords ***
get wash areas Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash areas  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_area/get_wash_areas_200.json

