*** Settings ***
Documentation  app_parking
Resource  ../resources.robot
Library  robot_car_wash_app_library.parking.ParkingLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_parking  虾客APP


*** Test Cases ***
Get car Wash parkings Success 
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  Get car Wash parkings Success 200  ${essential_params}  ${unessential_params}

Get car Wash parkings Fail With Wrong Params
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  Get car Wash parkings Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get car Wash parkings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash parkings   &{kwargs}
   expect status is 200  ${resp}  app_parking/Get_car_Wash_parkings_200.json

Get car Wash parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash parkings   &{kwargs}
   expect status is 422  ${resp}  

