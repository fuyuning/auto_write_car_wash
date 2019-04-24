*** Settings ***
Documentation  admin_parking
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking.ParkingLibrary
Force Tags  model:admin_parking  虾洗后台


*** Test Cases ***
Post Admin Parkings Fail Without Login
   [Documentation]  接口名:添加停车场信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  Post Admin Parkings Fail 403  ${essential_params}  ${unessential_params}

Get Admin Parkings Fail Without Login
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_name=${parking_name}  wash_area_id=${wash_area_id}  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Parkings Fail 403  ${essential_params}  ${unessential_params}

Get Admin Parkings By Parking Id Fail Without Login
   [Documentation]  接口名:停车场信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Parkings By Parking Id Fail 403  parking_id=${parking_id}

Put Admin Parkings By Parking Id Fail Without Login
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  Put Admin Parkings By Parking Id Fail 403  ${essential_params}  ${unessential_params}  parking_id=${parking_id}

Patch Enabled By Parking Id Fail Without Login
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  Patch Enabled By Parking Id Fail 403  ${essential_params}  ${unessential_params}  parking_id/enabled=${parking_id/enabled}

Delete Admin Parkings By Parking Id Fail Without Login
   [Documentation]  接口名:删除停车场信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Parkings By Parking Id Fail 403  parking_id=${parking_id}


*** Variables ***
${parking_id}  12345678909876543
${parking_id/enabled}  12345678909876543


*** Keywords ***
Post Admin Parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Parkings   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parkings   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Parkings By Parking Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Parkings By Parking Id   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Parkings By Parking Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Parkings By Parking Id   &{kwargs}
   expect status is 403  ${resp}  

Patch Enabled By Parking Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Enabled By Parking Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Parkings By Parking Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Parkings By Parking Id   &{kwargs}
   expect status is 403  ${resp}  

