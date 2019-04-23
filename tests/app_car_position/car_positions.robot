*** Settings ***
Documentation  app_car_position
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_position.CarPositionLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_car_position  虾客APP


*** Test Cases ***
Post car_position Success 
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  
   run every case by params  Post car wash car positions Success 201  ${essential_params}  ${unessential_params}



Post car_position Fail With Wrong Params
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  
   run every case by params  Post car wash car positions Fail 422  ${essential_params}  ${unessential_params}



Post car_position Fail Without Login
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  
   run every case by params  Post car wash car positions Fail 403  ${essential_params}  ${unessential_params}



Get car_position Fail Without Login
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  
   run every case by params  Get car wash car positions Fail 403  ${essential_params}  ${unessential_params}



Get car_position Success 
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  
   run every case by params  Get car wash car positions Success 200  ${essential_params}  ${unessential_params}



Get car_position Fail With Wrong Params
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  
   run every case by params  Get car wash car positions Fail 422  ${essential_params}  ${unessential_params}



Get car_position Fail Without Login
   [Documentation]  接口名:车位增量更新${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  section=${section}  
   run every case by params  Get car wash new car positions Fail 403  ${essential_params}  ${unessential_params}



Get car_position Fail With Wrong Params
   [Documentation]  接口名:车位增量更新${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  section=${section}  
   run every case by params  Get car wash new car positions Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Post Car wash car positions Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post car wash car positions   &{kwargs}
   expect status is 201  ${resp}  app_car_position/Post_Car_wash_car_positions_201.json

Post Car wash car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash car positions   &{kwargs}
   expect status is 422  ${resp}  

Post Car wash car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash car positions   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car positions   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash car positions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car positions   &{kwargs}
   expect status is 200  ${resp}  app_car_position/Get_Car_wash_car_positions_200.json

Get Car wash car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car positions   &{kwargs}
   expect status is 422  ${resp}  

Get Car wash new car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash new car positions   &{kwargs}
   expect status is 403  ${resp}  

Get Car wash new car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash new car positions   &{kwargs}
   expect status is 422  ${resp}  

