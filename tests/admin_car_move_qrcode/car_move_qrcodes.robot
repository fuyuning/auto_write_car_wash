*** Settings ***
Documentation  admin_car_move_qrcode
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_move_qrcode.CarMoveQrcodeLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_move_qrcode  虾洗后台


*** Test Cases ***
post admin car move qrcodes finish by car move qrcode id Fail With Wrong Url
   [Documentation]  接口名:申请通过${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  qrcode_remark=${qrcode_remark}  status=${status}  
   run every case by params  post admin car move qrcodes finish by car move qrcode id Fail 404  ${essential_params}  ${unessential_params}    car_move_qrcode_id/finish=${w}  car_move_qrcode_id=${r}

post admin car move qrcodes finish by car move qrcode id Success 
   [Documentation]  接口名:申请通过${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  qrcode_remark=${qrcode_remark}  status=${status}  
   run every case by params  post admin car move qrcodes finish by car move qrcode id Success 204  ${essential_params}  ${unessential_params}    car_move_qrcode_id/finish=${car_move_qrcode_id/finish}  car_move_qrcode_id=${car_move_qrcode_id}

post admin car move qrcodes finish by car move qrcode id Fail With Wrong Params
   [Documentation]  接口名:申请通过${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  qrcode_remark=${qrcode_remark_422}  status=${status_422}  
   run every case by params  post admin car move qrcodes finish by car move qrcode id Fail 422  ${essential_params}  ${unessential_params}    car_move_qrcode_id/finish=${car_move_qrcode_id/finish}  car_move_qrcode_id=${car_move_qrcode_id}  success=False

get admin car move qrcodes Success 
   [Documentation]  接口名:申请查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarMoveQrcode 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   ${unessential_params}  create list  car_move_qrcode_id=${car_move_qrcode_id}  user_id=${user_id}  mobile=${mobile}  status=${status}  created_section=${created_section}  
   run every case by params  get admin car move qrcodes Success 200  ${essential_params}  ${unessential_params}

get admin car move qrcodes Fail With Wrong Params
   [Documentation]  接口名:申请查询${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   ${unessential_params}  create list  car_move_qrcode_id=${car_move_qrcode_id_422}  user_id=${user_id_422}  mobile=${mobile_422}  status=${status_422}  created_section=${created_section_422}  
   run every case by params  get admin car move qrcodes Fail 422  ${essential_params}  ${unessential_params}  success=False

delete admin car move qrcodes by car move qrcode id Fail With Wrong Url
   [Documentation]  接口名:二维码删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin car move qrcodes by car move qrcode id Fail 404    car_move_qrcode_id/finish=${w}  car_move_qrcode_id=${r}

delete admin car move qrcodes by car move qrcode id Success 
   [Documentation]  接口名:二维码删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin car move qrcodes by car move qrcode id Success 204    car_move_qrcode_id/finish=${car_move_qrcode_id/finish}  car_move_qrcode_id=${car_move_qrcode_id}


*** Variables ***
${car_move_qrcode_id/finish}  
${car_move_qrcode_id}  


*** Keywords ***
post admin car move qrcodes finish by car move qrcode id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post admin car move qrcodes finish by car move qrcode id  &{kwargs}
   expect status is 404  ${resp}  

post admin car move qrcodes finish by car move qrcode id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post admin car move qrcodes finish by car move qrcode id  &{kwargs}
   expect status is 204  ${resp}  

post admin car move qrcodes finish by car move qrcode id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin car move qrcodes finish by car move qrcode id  &{kwargs}
   expect status is 422  ${resp}  

get admin car move qrcodes Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car move qrcodes  &{kwargs}
   expect status is 200  ${resp}  admin_car_move_qrcode/get_admin_car_move_qrcodes_200.json
   ${car_move_qrcode_id/finish}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_move_qrcode_id/finish]}
   set global variable   ${car_move_qrcode_id/finish}
   ${car_move_qrcode_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_move_qrcode_id]}
   set global variable   ${car_move_qrcode_id}

get admin car move qrcodes Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car move qrcodes  &{kwargs}
   expect status is 422  ${resp}  

delete admin car move qrcodes by car move qrcode id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car move qrcodes by car move qrcode id  &{kwargs}
   expect status is 404  ${resp}  

delete admin car move qrcodes by car move qrcode id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car move qrcodes by car move qrcode id  &{kwargs}
   expect status is 204  ${resp}  

