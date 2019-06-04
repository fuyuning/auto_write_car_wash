*** Settings ***
Documentation  app_parking
Resource  ../resources.robot
Library  robot_washing_expert_library.parking.ParkingLibrary
Force Tags  model:app_parking  虾客APP


*** Test Cases ***
get car wash parkings Fail Without Login
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash parkings fail 403     section=${section}  condition=${condition}  


*** Keywords ***
get car wash parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash parkings  &{kwargs}
   expect status is 403  ${resp}  

