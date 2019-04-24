*** Settings ***
Documentation  app_parking
Resource  ../resources.robot
Library  robot_car_wash_app_library.parking.ParkingLibrary
Force Tags  model:app_parking  虾客APP


*** Test Cases ***
Get car Wash parkings Fail Without Login
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  Get car Wash parkings Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Get car Wash parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash parkings   &{kwargs}
   expect status is 403  ${resp}  

