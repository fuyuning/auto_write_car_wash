*** Settings ***
Documentation  admin_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_move_qrcode.CarMoveQrcodeLibrary
Force Tags  model:admin_car_move_qrcode  虾洗后台


*** Test Cases ***
post admin car move qrcodes finish by car move qrcode id Fail Without Login
   [Documentation]  接口名:申请通过${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin car move qrcodes finish by car move qrcode id fail 403     car_move_qrcode_id=${car_move_qrcode_id}    qrcode_remark=${qrcode_remark}  status=${status}  

get admin car move qrcodes Fail Without Login
   [Documentation]  接口名:申请查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car move qrcodes fail 403   page_num=${page_num}  page_size=${page_size}    car_move_qrcode_id=${car_move_qrcode_id}  user_id=${user_id}  mobile=${mobile}  status=${status}  created_section=${created_section}  

delete admin car move qrcodes by car move qrcode id Fail Without Login
   [Documentation]  接口名:二维码删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin car move qrcodes by car move qrcode id fail 403     car_move_qrcode_id=${car_move_qrcode_id}


*** Variables ***
${car_move_qrcode_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin car move qrcodes finish by car move qrcode id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin car move qrcodes finish by car move qrcode id  &{kwargs}
   expect status is 403  ${resp}  

get admin car move qrcodes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car move qrcodes  &{kwargs}
   expect status is 403  ${resp}  

delete admin car move qrcodes by car move qrcode id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car move qrcodes by car move qrcode id  &{kwargs}
   expect status is 403  ${resp}  

