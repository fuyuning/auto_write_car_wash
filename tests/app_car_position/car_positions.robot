*** Settings ***
Documentation  app_car_position
Resource  ../resources.robot
Library  robot_car_wash_app_library.car_position.CarPositionLibrary
Suite Setup  Login  ${app_username}  ${app_password}

Force Tags  model:app_car_position  虾客APP


*** Test Cases ***
Post car Wash car positions Success 
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  
   run every case by params  Post car Wash car positions Success 201  ${essential_params}  ${unessential_params}

Post car Wash car positions Fail With Wrong Params
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  
   run every case by params  Post car Wash car positions Fail 422  ${essential_params}  ${unessential_params}

Get car Wash car positions Success 
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CarPosition 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  
   run every case by params  Get car Wash car positions Success 200  ${essential_params}  ${unessential_params}

Get car Wash car positions Fail With Wrong Params
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  car_ids=${car_ids}  
   ${unessential_params}  create list  parking_id=${parking_id}  wash_area_id=${wash_area_id}  
   run every case by params  Get car Wash car positions Fail 422  ${essential_params}  ${unessential_params}

Get car Wash new car positions Fail With Wrong Params
   [Documentation]  接口名:车位增量更新${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  section=${section}  
   run every case by params  Get car Wash new car positions Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post car Wash car positions Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post car Wash car positions   &{kwargs}
   expect status is 201  ${resp}  app_car_position/Post_car_Wash_car_positions_201.json

Post car Wash car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post car Wash car positions   &{kwargs}
   expect status is 422  ${resp}  

Get car Wash car positions Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash car positions   &{kwargs}
   expect status is 200  ${resp}  app_car_position/Get_car_Wash_car_positions_200.json

Get car Wash car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash car positions   &{kwargs}
   expect status is 422  ${resp}  

Get car Wash new car positions Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get car Wash new car positions   &{kwargs}
   expect status is 422  ${resp}  

