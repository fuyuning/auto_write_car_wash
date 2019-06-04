*** Settings ***
Documentation  admin_car_position
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_position.CarPositionLibrary
Force Tags  model:admin_car_position  虾洗后台


*** Test Cases ***
post admin car positions import Fail Without Login
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    post admin car positions import fail 403

post admin car positions manual Fail Without Login
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin car positions manual fail 403   car_id=${car_id}  parking_id=${parking_id}    wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  

get admin car positions Fail Without Login
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car positions fail 403   car_id=${car_id}    page_num=${page_num}  page_size=${page_size}  

get admin car positions car postion id by  Fail Without Login
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car positions car postion id by  fail 403     =${}

put admin car positions by car position id Fail Without Login
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin car positions by car position id fail 403     car_position_id=${car_position_id}  car_id=${car_id}  parking_id=${parking_id}    wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  

delete admin car positions by car position id Fail Without Login
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin car positions by car position id fail 403     car_position_id=${car_position_id}


*** Variables ***
${}  1a2b3c4d5e6f7zz
${car_position_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin car positions import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin car positions import  &{kwargs}
   expect status is 403  ${resp}  

post admin car positions manual Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin car positions manual  &{kwargs}
   expect status is 403  ${resp}  

get admin car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions  &{kwargs}
   expect status is 403  ${resp}  

get admin car positions car postion id by  Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions car postion id by   &{kwargs}
   expect status is 403  ${resp}  

put admin car positions by car position id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 403  ${resp}  

delete admin car positions by car position id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car positions by car position id  &{kwargs}
   expect status is 403  ${resp}  

