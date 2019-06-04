*** Settings ***
Documentation  wxmp_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_move_qrcode.CarMoveQrcodeLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_car_move_qrcode  车主微信端


*** Test Cases ***
post user car move qrcodes Success 
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  wash_area_name=${wash_area_name}  car_id=${car_id}  
   ${unessential_params}  create dictionary  mobile=${mobile}  
   run every case by params   post user car move qrcodes success 204   ${essential_params}  ${unessential_params}

post user car move qrcodes Fail With Wrong Params
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wash_area_name=${wash_area_name_422}  car_id=${car_id_422}  
   ${unessential_params}  create dictionary  mobile=${mobile_422}  
   run every case by params   post user car move qrcodes fail 422   ${essential_params}  ${unessential_params}  success=False

get user car move qrcodes Success 
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarMoveQrcode 列表。
   [Tags]           Respcode:200
    get user car move qrcodes success 200


*** Keywords ***
post user car move qrcodes Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post user car move qrcodes  &{kwargs}
   expect status is 204  ${resp}  

post user car move qrcodes Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user car move qrcodes  &{kwargs}
   expect status is 422  ${resp}  

get user car move qrcodes Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user car move qrcodes  &{kwargs}
   expect status is 200  ${resp}  wxmp_car_move_qrcode/get_user_car_move_qrcodes_200.json

