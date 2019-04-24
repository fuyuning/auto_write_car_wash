*** Settings ***
Documentation  wxmp_parking
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.parking.ParkingLibrary
Force Tags  model:wxmp_parking  车主微信端


*** Test Cases ***
Get Parkings Nearby Fail Without Login
   [Documentation]  接口名:根据距离获取停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_type=${service_type}  radius=${radius}  center=${center}  
   ${unessential_params}  create list  page_limit=${page_limit}  
   run every case by params  Get Parkings Nearby Fail 403  ${essential_params}  ${unessential_params}

Get Parkings Fail Without Login
   [Documentation]  接口名:模糊查询停车场信息${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  service_type=${service_type}  parking_name=${parking_name}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Parkings Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Parkings Nearby Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Parkings Nearby   &{kwargs}
   expect status is 403  ${resp}  

Get Parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Parkings   &{kwargs}
   expect status is 403  ${resp}  

