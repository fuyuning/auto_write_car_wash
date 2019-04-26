*** Settings ***
Documentation  wxmp_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_normal.WashNormalLibrary
Force Tags  model:wxmp_wash_normal  车主微信端


*** Test Cases ***
Get Wash Normals Fail Without Login
   [Documentation]  接口名:用洗车区域id获取单买详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  can_order=False  
   run every case by params  Get Wash Normals Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Wash Normals Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Wash Normals   &{kwargs}
   expect status is 403  ${resp}  

