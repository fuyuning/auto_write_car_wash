*** Settings ***
Documentation  wxmp_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_move_qrcode.CarMoveQrcodeLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_car_move_qrcode  车主微信端


*** Test Cases ***
Post User Car Move Qrcodes Success 
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post User Car Move Qrcodes Success 204  ${essential_params}  ${unessential_params}

Post User Car Move Qrcodes Fail With Wrong Params
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post User Car Move Qrcodes Fail 422  ${essential_params}  ${unessential_params}

Get User Car Move Qrcodes Fail With Wrong Url
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get User Car Move Qrcodes Fail 404

Get User Car Move Qrcodes Success 
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarMoveQrcode 列表。
   [Tags]           Respcode:200
    Get User Car Move Qrcodes Success 200


*** Keywords ***
Post User Car Move Qrcodes Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post User Car Move Qrcodes   &{kwargs}
   expect status is 204  ${resp}  

Post User Car Move Qrcodes Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post User Car Move Qrcodes   &{kwargs}
   expect status is 422  ${resp}  

Get User Car Move Qrcodes Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get User Car Move Qrcodes   &{kwargs}
   expect status is 404  ${resp}  

Get User Car Move Qrcodes Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get User Car Move Qrcodes   &{kwargs}
   expect status is 200  ${resp}  wxmp_car_move_qrcode/Get_User_Car_Move_Qrcodes_200.json

