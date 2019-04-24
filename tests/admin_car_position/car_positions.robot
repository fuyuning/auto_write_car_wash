*** Settings ***
Documentation  admin_car_position
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_position.CarPositionLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_car_position  虾洗后台


*** Test Cases ***
Post car Positions import Success 
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
    Post car Positions import Success 200

Post car Positions manual Fail With Wrong Params
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Post car Positions manual Fail 422  ${essential_params}  ${unessential_params}

Post car Positions manual Success 
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Post car Positions manual Success 201  ${essential_params}  ${unessential_params}

Get Admin Car Positions Success 
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Positions Success 200  ${essential_params}  ${unessential_params}

Get Admin Car Positions Fail With Wrong Params
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Positions Fail 422  ${essential_params}  ${unessential_params}

Get car Postion Id Fail With Wrong Url
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get car Postion Id Fail 404  /car_postion_id=${wrong_url_id}

Get car Postion Id Success 
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 对象。
   [Tags]           Respcode:200
   Get car Postion Id Success 200  /car_postion_id=${/car_postion_id}

Put Admin Car Positions By Car Position Id Fail With Wrong Url
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put Admin Car Positions By Car Position Id Fail 404  ${essential_params}  ${unessential_params}  car_position_id=${wrong_url_id}

Put Admin Car Positions By Car Position Id Fail With Wrong Params
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put Admin Car Positions By Car Position Id Fail 422  ${essential_params}  ${unessential_params}  car_position_id=${car_position_id}

Put Admin Car Positions By Car Position Id Success 
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put Admin Car Positions By Car Position Id Success 204  ${essential_params}  ${unessential_params}  car_position_id=${car_position_id}

Delete Admin Car Positions By Car Position Id Fail With Wrong Url
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Car Positions By Car Position Id Fail 404  car_position_id=${wrong_url_id}

Delete Admin Car Positions By Car Position Id Success 
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Car Positions By Car Position Id Success 204  car_position_id=${car_position_id}


*** Variables ***
${/car_postion_id}  
${car_position_id}  


*** Keywords ***
Post car Positions import Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post car Positions import   &{kwargs}
   expect status is 200  ${resp}  admin_car_position/Post_car_Positions_import_200.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Post car Positions manual Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post car Positions manual   &{kwargs}
   expect status is 422  ${resp}  

Post car Positions manual Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post car Positions manual   &{kwargs}
   expect status is 201  ${resp}  admin_car_position/Post_car_Positions_manual_201.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Get Admin Car Positions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Positions   &{kwargs}
   expect status is 200  ${resp}  admin_car_position/Get_Admin_Car_Positions_200.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Get Admin Car Positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Positions   &{kwargs}
   expect status is 422  ${resp}  

Get car Postion Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get car Postion Id   &{kwargs}
   expect status is 404  ${resp}  

Get car Postion Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Postion Id   &{kwargs}
   expect status is 200  ${resp}  admin_car_position/Get_car_Postion_Id_200.json
   ${/car_postion_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][/car_postion_id]}
   set global variable   ${/car_postion_id}
   ${car_position_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][car_position_id]}
   set global variable   ${car_position_id}

Put Admin Car Positions By Car Position Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Positions By Car Position Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Car Positions By Car Position Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Positions By Car Position Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Car Positions By Car Position Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Positions By Car Position Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Car Positions By Car Position Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Car Positions By Car Position Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Car Positions By Car Position Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Car Positions By Car Position Id   &{kwargs}
   expect status is 204  ${resp}  

