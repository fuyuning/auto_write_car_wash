*** Settings ***
Documentation  wxmp_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.wash_normal.WashNormalLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_wash_normal  车主微信端


*** Test Cases ***
get wash normals Success 
   [Documentation]  接口名:用洗车区域id获取单买详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashNormal 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  wash_area_id=${wash_area_id}  
   ${unessential_params}  create list  can_order=False  
   run every case by params  get wash normals Success 200  ${essential_params}  ${unessential_params}

get wash normals Fail With Wrong Params
   [Documentation]  接口名:用洗车区域id获取单买详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_area_id=${wash_area_id_422}  
   ${unessential_params}  create list  can_order=ThisIsRobot!  
   run every case by params  get wash normals Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get wash normals Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get wash normals  &{kwargs}
   expect status is 200  ${resp}  wxmp_wash_normal/get_wash_normals_200.json

get wash normals Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get wash normals  &{kwargs}
   expect status is 422  ${resp}  

