*** Settings ***
Documentation  wxmp_wash_area
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_area.WashAreaLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_wash_area  车主微信端


*** Test Cases ***
Get wash_area Fail Without Login
   [Documentation]  接口名:获取洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get wash areas Fail 403


Get wash_area Success 
   [Documentation]  接口名:获取洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashArea 列表。
   [Tags]           Respcode:200
    Get wash areas Success 200


Get wash_area Fail With Wrong Params
   [Documentation]  接口名:获取洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
    Get wash areas Fail 422


*** Variables ***


*** Keywords ***
Get Wash areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash areas   &{kwargs}
   expect status is 403  ${resp}  

Get Wash areas Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash areas   &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_area/Get_Wash_areas_200.json

Get Wash areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash areas   &{kwargs}
   expect status is 422  ${resp}  

