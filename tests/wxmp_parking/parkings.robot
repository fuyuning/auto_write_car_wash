*** Settings ***
Documentation  wxmp_parking
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.parking.ParkingLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_parking  车主微信端


*** Test Cases ***
Get Parkings Nearby Success 
   [Documentation]  接口名:根据距离获取停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  service_type=${service_type}  radius=${radius}  center=${center}  
   ${unessential_params}  create list  page_limit=${page_limit}  
   run every case by params  Get Parkings Nearby Success 200  ${essential_params}  ${unessential_params}

Get Parkings Nearby Fail With Wrong Params
   [Documentation]  接口名:根据距离获取停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_type=${service_type}  radius=${radius}  center=${center}  
   ${unessential_params}  create list  page_limit=${page_limit}  
   run every case by params  Get Parkings Nearby Fail 422  ${essential_params}  ${unessential_params}

Get Parkings Success 
   [Documentation]  接口名:模糊查询停车场信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  service_type=${service_type}  parking_name=${parking_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Parkings Success 200  ${essential_params}  ${unessential_params}

Get Parkings Fail With Wrong Params
   [Documentation]  接口名:模糊查询停车场信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  service_type=${service_type}  parking_name=${parking_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Parkings Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Parkings Nearby Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Parkings Nearby   &{kwargs}
   expect status is 200  ${resp}  wxmp_parking/Get_Parkings_Nearby_200.json

Get Parkings Nearby Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Parkings Nearby   &{kwargs}
   expect status is 422  ${resp}  

Get Parkings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Parkings   &{kwargs}
   expect status is 200  ${resp}  wxmp_parking/Get_Parkings_200.json

Get Parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Parkings   &{kwargs}
   expect status is 422  ${resp}  

