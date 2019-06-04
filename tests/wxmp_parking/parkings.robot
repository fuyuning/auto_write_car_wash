*** Settings ***
Documentation  wxmp_parking
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.parking.ParkingLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_parking  车主微信端


*** Test Cases ***
get parkings nearby Success 
   [Documentation]  接口名:根据距离获取停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  service_type=${service_type}  radius=${radius}  center=${center}  
   ${unessential_params}  create dictionary  page_limit=${page_limit}  
   run every case by params   get parkings nearby success 200   ${essential_params}  ${unessential_params}

get parkings nearby Fail With Wrong Params
   [Documentation]  接口名:根据距离获取停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  service_type=${service_type_422}  radius=${radius_422}  center=${center_422}  
   ${unessential_params}  create dictionary  page_limit=${page_limit_422}  
   run every case by params   get parkings nearby fail 422   ${essential_params}  ${unessential_params}  success=False

get parkings Success 
   [Documentation]  接口名:模糊查询停车场信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Parking 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  service_type=${service_type}  parking_name=${parking_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get parkings success 200   ${essential_params}  ${unessential_params}

get parkings Fail With Wrong Params
   [Documentation]  接口名:模糊查询停车场信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  service_type=${service_type_422}  parking_name=${parking_name_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get parkings fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get parkings nearby Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get parkings nearby  &{kwargs}
   expect status is 200  ${resp}  wxmp_parking/get_parkings_nearby_200.json

get parkings nearby Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get parkings nearby  &{kwargs}
   expect status is 422  ${resp}  

get parkings Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get parkings  &{kwargs}
   expect status is 200  ${resp}  wxmp_parking/get_parkings_200.json

get parkings Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get parkings  &{kwargs}
   expect status is 422  ${resp}  

