*** Settings ***
Documentation  admin_car_position
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_position.CarPositionLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_position  虾洗后台


*** Test Cases ***
post admin car positions import Success 
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    post admin car positions import Success 200

post admin car positions manual Fail With Wrong Params
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id_422}  parking_id=${parking_id_422}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id_422}  entry_time=${entry_time_422}  lon=${lon_422}  lat=${lat_422}  phase=${phase_422}  floor=${floor_422}  zone=${zone_422}  space_no=${space_no_422}  ownership=${ownership_422}  
   run every case by params  post admin car positions manual Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin car positions manual Success 
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  post admin car positions manual Success 201  ${essential_params}  ${unessential_params}

get admin car positions Success 
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car positions Success 200  ${essential_params}  ${unessential_params}

get admin car positions Fail With Wrong Params
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id_422}  
   ${unessential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin car positions Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin car positions car postion id by  Fail With Wrong Url
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin car positions car postion id by  Fail 404    =${wrong_url_id}  car_position_id=${wrong_url_id}

get admin car positions car postion id by  Success 
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 对象。
   [Tags]           Respcode:200
   get admin car positions car postion id by  Success 200    =${}  car_position_id=${car_position_id}

put admin car positions by car position id Fail With Wrong Url
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  put admin car positions by car position id Fail 404  ${essential_params}  ${unessential_params}    =${wrong_url_id}  car_position_id=${wrong_url_id}

put admin car positions by car position id Fail With Wrong Params
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id_422}  parking_id=${parking_id_422}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id_422}  entry_time=${entry_time_422}  lon=${lon_422}  lat=${lat_422}  phase=${phase_422}  floor=${floor_422}  zone=${zone_422}  space_no=${space_no_422}  ownership=${ownership_422}  
   run every case by params  put admin car positions by car position id Fail 422  ${essential_params}  ${unessential_params}    =${}  car_position_id=${car_position_id}  success=False

put admin car positions by car position id Success 
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  put admin car positions by car position id Success 204  ${essential_params}  ${unessential_params}    =${}  car_position_id=${car_position_id}

delete admin car positions by car position id Fail With Wrong Url
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin car positions by car position id Fail 404    =${wrong_url_id}  car_position_id=${wrong_url_id}

delete admin car positions by car position id Success 
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin car positions by car position id Success 204    =${}  car_position_id=${car_position_id}


*** Variables ***
${}  
${car_position_id}  


*** Keywords ***
post admin car positions import Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin car positions import  &{kwargs}
   expect status is 200  ${resp}  admin_car_position/post_admin_car_positions_import_200.json
   ${}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][]}
   set global variable   ${}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

post admin car positions manual Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin car positions manual  &{kwargs}
   expect status is 422  ${resp}  

post admin car positions manual Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin car positions manual  &{kwargs}
   expect status is 201  ${resp}  admin_car_position/post_admin_car_positions_manual_201.json
   ${}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][]}
   set global variable   ${}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

get admin car positions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions  &{kwargs}
   expect status is 200  ${resp}  admin_car_position/get_admin_car_positions_200.json
   ${}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][]}
   set global variable   ${}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

get admin car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions  &{kwargs}
   expect status is 422  ${resp}  

get admin car positions car postion id by  Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions car postion id by   &{kwargs}
   expect status is 404  ${resp}  

get admin car positions car postion id by  Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions car postion id by   &{kwargs}
   expect status is 200  ${resp}  admin_car_position/get_admin_car_positions_car_postion_id_by__200.json
   ${}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][]}
   set global variable   ${}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

put admin car positions by car position id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 404  ${resp}  

put admin car positions by car position id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 422  ${resp}  

put admin car positions by car position id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 204  ${resp}  

delete admin car positions by car position id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car positions by car position id  &{kwargs}
   expect status is 404  ${resp}  

delete admin car positions by car position id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car positions by car position id  &{kwargs}
   expect status is 204  ${resp}  

