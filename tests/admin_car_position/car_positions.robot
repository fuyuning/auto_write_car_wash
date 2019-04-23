*** Settings ***
Documentation  admin_car_position
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_position.CarPositionLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_position  虾洗后台


*** Test Cases ***
Post car_position Fail Without Login
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Post car positions import Fail 403


Post car_position Success 
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Post car positions import Success 200


Post car_position Success 
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Post car positions manual Success 201  ${essential_params}  ${unessential_params}



Post car_position Fail With Wrong Params
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Post car positions manual Fail 422  ${essential_params}  ${unessential_params}



Post car_position Fail Without Login
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Post car positions manual Fail 403  ${essential_params}  ${unessential_params}



Get car_position Fail Without Login
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car positions Fail 403  ${essential_params}  ${unessential_params}



Get car_position Success 
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car positions Success 200  ${essential_params}  ${unessential_params}



Get car_position Fail With Wrong Params
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin car positions Fail 422  ${essential_params}  ${unessential_params}



Get car_position By Id Fail With Wrong Url
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin car positions By Id Fail 404  /car_postion_id=${wrong_url_id}



Get car_position By Id Fail Without Login
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin car positions By Id Fail 403  /car_postion_id=${/car_postion_id}



Get car_position By Id Success 
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 对象。
   [Tags]           Respcode:200
   Get admin car positions By Id Success 200  /car_postion_id=${/car_postion_id}



Put car_position By Id Success 
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put admin car positions By Id Success 204  ${essential_params}  ${unessential_params}  car_position_id=${car_position_id}



Put car_position By Id Fail With Wrong Url
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put admin car positions By Id Fail 404  ${essential_params}  ${unessential_params}  car_position_id=${wrong_url_id}



Put car_position By Id Fail With Wrong Params
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put admin car positions By Id Fail 422  ${essential_params}  ${unessential_params}  car_position_id=${car_position_id}



Put car_position By Id Fail Without Login
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put admin car positions By Id Fail 403  ${essential_params}  ${unessential_params}  car_position_id=${car_position_id}



Delete car_position By Id Success 
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin car positions By Id Success 204  car_position_id=${car_position_id}



Delete car_position By Id Fail With Wrong Url
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin car positions By Id Fail 404  car_position_id=${wrong_url_id}



Delete car_position By Id Fail Without Login
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin car positions By Id Fail 403  car_position_id=${car_position_id}



*** Variables ***
${/car_postion_id}
${car_position_id}


*** Keywords ***
Post Car positions import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car positions import   &{kwargs}
   expect status is 403  ${resp}  

Post Car positions import Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post car positions import   &{kwargs}
   expect status is 200  ${resp}  admin_car_position/Post_Car_positions_import_200.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Post Car positions manual Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post car positions manual   &{kwargs}
   expect status is 201  ${resp}  admin_car_position/Post_Car_positions_manual_201.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Post Car positions manual Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car positions manual   &{kwargs}
   expect status is 422  ${resp}  

Post Car positions manual Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car positions manual   &{kwargs}
   expect status is 403  ${resp}  

Get Admin car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions   &{kwargs}
   expect status is 403  ${resp}  

Get Admin car positions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions   &{kwargs}
   expect status is 200  ${resp}  admin_car_position/Get_Admin_car_positions_200.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Get Admin car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin car positions   &{kwargs}
   expect status is 422  ${resp}  

Get Admin car positions By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get car postion id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin car positions By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car postion id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin car positions By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car postion id   &{kwargs}
   expect status is 200  ${resp}  admin_car_position/Get_Admin_car_positions_By_Id_200.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Put Admin car positions By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin car positions By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 404  ${resp}  

Put Admin car positions By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin car positions By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin car positions by car position id  &{kwargs}
   expect status is 403  ${resp}  

Delete Admin car positions By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car positions by car position id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin car positions By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car positions by car position id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin car positions By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin car positions by car position id  &{kwargs}
   expect status is 403  ${resp}  

