*** Settings ***
Documentation  wxmp_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_normal.WashNormalLibrary
Force Tags  model:wxmp_wash_normal  车主微信端


*** Test Cases ***
get wash normals Fail Without Login
   [Documentation]  接口名:用洗车区域id获取单买详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get wash normals fail 403   wash_area_id=${wash_area_id}    


*** Keywords ***
get wash normals Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get wash normals  &{kwargs}
   expect status is 403  ${resp}  

