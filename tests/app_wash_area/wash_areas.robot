*** Settings ***
Documentation  app_wash_area
Resource  ../resources.robot
Library  robot_washing_expert_library.wash_area.WashAreaLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_wash_area  虾客APP


*** Test Cases ***
get car wash wash areas Success 
   [Documentation]  接口名:获取全部洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashArea 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  section=${section}  condition=${condition}  
   run every case by params   get car wash wash areas success 200   ${essential_params}  ${unessential_params}

get car wash wash areas Fail With Wrong Params
   [Documentation]  接口名:获取全部洗车区域列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  section=${section_422}  condition=${condition_422}  
   run every case by params   get car wash wash areas fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get car wash wash areas Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash areas  &{kwargs}
   expect status is 200  ${resp}  app_wash_area/get_car_wash_wash_areas_200.json

get car wash wash areas Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash wash areas  &{kwargs}
   expect status is 422  ${resp}  

