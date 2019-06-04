*** Settings ***
Documentation  app_car_position
Resource  ../resources.robot
Library  robot_washing_expert_library.car_position.CarPositionLibrary
Suite Setup  Login  ${username}   ${password}
Force Tags  model:app_car_position  虾客APP


*** Test Cases ***
post car wash car positions Fail With Wrong Params
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_id=${car_id_422}  parking_id=${parking_id_422}  
   ${unessential_params}  create dictionary  wash_area_id=${wash_area_id_422}  entry_time=${entry_time_422}  lon=${lon_422}  lat=${lat_422}  phase=${phase_422}  floor=${floor_422}  zone=${zone_422}  space_no=${space_no_422}  
   run every case by params   post car wash car positions fail 422   ${essential_params}  ${unessential_params}  success=False

post car wash car positions Success 
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create dictionary  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  
   run every case by params   post car wash car positions success 201   ${essential_params}  ${unessential_params}

get car wash car positions Success 
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  car_ids=${car_ids}  
   ${unessential_params}  create dictionary  parking_id=${parking_id}  wash_area_id=${wash_area_id}  
   run every case by params   get car wash car positions success 200   ${essential_params}  ${unessential_params}

get car wash car positions Fail With Wrong Params
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  car_ids=${car_ids_422}  
   ${unessential_params}  create dictionary  parking_id=${parking_id_422}  wash_area_id=${wash_area_id_422}  
   run every case by params   get car wash car positions fail 422   ${essential_params}  ${unessential_params}  success=False

get car wash new car positions Success 
   [Documentation]  接口名:车位增量更新${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  parking_id=${parking_id}  
   ${unessential_params}  create dictionary  wash_area_id=${wash_area_id}  section=${section}  
   run every case by params   get car wash new car positions success 200   ${essential_params}  ${unessential_params}

get car wash new car positions Fail With Wrong Params
   [Documentation]  接口名:车位增量更新${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  parking_id=${parking_id_422}  
   ${unessential_params}  create dictionary  wash_area_id=${wash_area_id_422}  section=${section_422}  
   run every case by params   get car wash new car positions fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post car wash car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post car wash car positions  &{kwargs}
   expect status is 422  ${resp}  

post car wash car positions Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post car wash car positions  &{kwargs}
   expect status is 201  ${resp}  app_car_position/post_car_wash_car_positions_201.json

get car wash car positions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car positions  &{kwargs}
   expect status is 200  ${resp}  app_car_position/get_car_wash_car_positions_200.json

get car wash car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car positions  &{kwargs}
   expect status is 422  ${resp}  

get car wash new car positions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get car wash new car positions  &{kwargs}
   expect status is 200  ${resp}  app_car_position/get_car_wash_new_car_positions_200.json

get car wash new car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get car wash new car positions  &{kwargs}
   expect status is 422  ${resp}  

