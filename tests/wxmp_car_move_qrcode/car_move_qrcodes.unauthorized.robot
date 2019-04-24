*** Settings ***
Documentation  wxmp_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_move_qrcode.CarMoveQrcodeLibrary
Force Tags  model:wxmp_car_move_qrcode  车主微信端


*** Test Cases ***
Post User Car Move Qrcodes Fail Without Login
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post User Car Move Qrcodes Fail 403  ${essential_params}  ${unessential_params}

Get User Car Move Qrcodes Fail Without Login
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get User Car Move Qrcodes Fail 403


*** Keywords ***
Post User Car Move Qrcodes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post User Car Move Qrcodes   &{kwargs}
   expect status is 403  ${resp}  

Get User Car Move Qrcodes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get User Car Move Qrcodes   &{kwargs}
   expect status is 403  ${resp}  

