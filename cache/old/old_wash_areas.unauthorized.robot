*** Settings ***
Documentation  wxmp_wash_area
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_area.WashAreaLibrary
Force Tags  model:wxmp_wash_area  车主微信端


*** Test Cases ***
Get Wash Areas Fail Without Login
   [Documentation]  接口名:获取洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get Wash Areas Fail 403


*** Keywords ***
Get Wash Areas Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Areas   &{kwargs}
   expect status is 403  ${resp}  

