*** Settings ***
Documentation  app_parking
Resource  ../resources.robot
Library  robot_car_wash_app_library.parking.ParkingLibrary
Suite Setup  Login  ${app_username}  ${app_password}
Force Tags  model:app_parking  虾客APP


*** Test Cases ***
get car wash parkings Success 
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  condition=${condition}  
   run every case by params  get car wash parkings Success 200  ${essential_params}  ${unessential_params}

get car wash parkings Fail With Wrong Params
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section_422}  condition=${condition_422}  
   run every case by params  get car wash parkings Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get car wash parkings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash parkings  &{kwargs}
   expect status is 200  ${resp}  app_parking/get_car_wash_parkings_200.json

get car wash parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash parkings  &{kwargs}
   expect status is 422  ${resp}  

