*** Settings ***
Documentation  admin_parking
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking.ParkingLibrary
Force Tags  model:admin_parking  虾洗后台


*** Test Cases ***
post admin parkings Fail Without Login
   [Documentation]  接口名:添加停车场信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  post admin parkings Fail 403  ${essential_params}  ${unessential_params}

get admin parkings Fail Without Login
   [Documentation]  接口名:停车场信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  parking_name=${parking_name}  wash_area_id=${wash_area_id}  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin parkings Fail 403  ${essential_params}  ${unessential_params}

get admin parkings by parking id Fail Without Login
   [Documentation]  接口名:停车场信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin parkings by parking id Fail 403    parking_id=${parking_id}  parking_id/enabled=${parking_id/enabled}

put admin parkings by parking id Fail Without Login
   [Documentation]  接口名:修改停车场信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  parking_name=${parking_name}  position=${position}  
   ${unessential_params}  create list  alias_name=${alias_name}  wash_area_id=${wash_area_id}  out_parking_id=${out_parking_id}  enabled=False  lon=${lon}  lat=${lat}  parking_banners=${parking_banners}  use_home_banner=False  service_introduce=${service_introduce}  address=${address}  use_home_illustrate=False  province=${province}  city=${city}  district=${district}  
   run every case by params  put admin parkings by parking id Fail 403  ${essential_params}  ${unessential_params}    parking_id=${parking_id}  parking_id/enabled=${parking_id/enabled}

patch admin parkings enabled by parking id Fail Without Login
   [Documentation]  接口名:停车场服务状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  enabled=False  
   ${unessential_params}  create list  
   run every case by params  patch admin parkings enabled by parking id Fail 403  ${essential_params}  ${unessential_params}    parking_id=${parking_id}  parking_id/enabled=${parking_id/enabled}

delete admin parkings by parking id Fail Without Login
   [Documentation]  接口名:删除停车场信息${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin parkings by parking id Fail 403    parking_id=${parking_id}  parking_id/enabled=${parking_id/enabled}


*** Variables ***
${parking_id}  12345678909876543
${parking_id/enabled}  12345678909876543


*** Keywords ***
post admin parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin parkings  &{kwargs}
   expect status is 403  ${resp}  

get admin parkings Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin parkings  &{kwargs}
   expect status is 403  ${resp}  

get admin parkings by parking id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin parkings by parking id  &{kwargs}
   expect status is 403  ${resp}  

put admin parkings by parking id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin parkings by parking id  &{kwargs}
   expect status is 403  ${resp}  

patch admin parkings enabled by parking id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parkings enabled by parking id  &{kwargs}
   expect status is 403  ${resp}  

delete admin parkings by parking id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin parkings by parking id  &{kwargs}
   expect status is 403  ${resp}  

