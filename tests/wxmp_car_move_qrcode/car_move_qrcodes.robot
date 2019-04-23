*** Settings ***
Documentation  wxmp_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_move_qrcode.CarMoveQrcodeLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_car_move_qrcode  车主微信端


*** Test Cases ***
Post car_move_qrcode Fail Without Login
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post user car move qrcodes Fail 403  ${essential_params}  ${unessential_params}



Post car_move_qrcode Success 
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post user car move qrcodes Success 204  ${essential_params}  ${unessential_params}



Post car_move_qrcode Fail With Wrong Params
   [Documentation]  接口名:申请二维码${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  
   run every case by params  Post user car move qrcodes Fail 422  ${essential_params}  ${unessential_params}



Get car_move_qrcode Fail Without Login
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Get user car move qrcodes Fail 403


Get car_move_qrcode Fail With Wrong Url
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
    Get user car move qrcodes Fail 404


Get car_move_qrcode Success 
   [Documentation]  接口名:申请状态查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarMoveQrcode 列表。
   [Tags]           Respcode:200
    Get user car move qrcodes Success 200


*** Variables ***


*** Keywords ***
Post User car move qrcodes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user car move qrcodes   &{kwargs}
   expect status is 403  ${resp}  

Post User car move qrcodes Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post user car move qrcodes   &{kwargs}
   expect status is 204  ${resp}  

Post User car move qrcodes Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post user car move qrcodes   &{kwargs}
   expect status is 422  ${resp}  

Get User car move qrcodes Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user car move qrcodes   &{kwargs}
   expect status is 403  ${resp}  

Get User car move qrcodes Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get user car move qrcodes   &{kwargs}
   expect status is 404  ${resp}  

Get User car move qrcodes Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get user car move qrcodes   &{kwargs}
   expect status is 200  ${resp}  wxmp_car_move_qrcode/Get_User_car_move_qrcodes_200.json

