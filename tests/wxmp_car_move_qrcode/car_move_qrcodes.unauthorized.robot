*** Settings ***
Documentation  wxmp_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_move_qrcode.CarMoveQrcodeLibrary
Force Tags  model:wxmp_car_move_qrcode  车主微信端


*** Test Cases ***
post user car move qrcodes Fail Without Login
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user car move qrcodes fail 403   wash_area_name=${wash_area_name}  car_id=${car_id}    mobile=${mobile}  

get user car move qrcodes Fail Without Login
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get user car move qrcodes fail 403


*** Keywords ***
post user car move qrcodes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user car move qrcodes  &{kwargs}
   expect status is 403  ${resp}  

get user car move qrcodes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user car move qrcodes  &{kwargs}
   expect status is 403  ${resp}  

