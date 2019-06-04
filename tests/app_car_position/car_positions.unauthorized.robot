*** Settings ***
Documentation  app_car_position
Resource  ../resources.robot
Library  robot_washing_expert_library.car_position.CarPositionLibrary
Force Tags  model:app_car_position  虾客APP


*** Test Cases ***
post car wash car positions Fail Without Login
   [Documentation]  接口名:采集车辆信息${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post car wash car positions fail 403   car_id=${car_id}  parking_id=${parking_id}    wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  

get car wash car positions Fail Without Login
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash car positions fail 403   car_ids=${car_ids}    parking_id=${parking_id}  wash_area_id=${wash_area_id}  

get car wash new car positions Fail Without Login
   [Documentation]  接口名:车位增量更新${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash new car positions fail 403   parking_id=${parking_id}    wash_area_id=${wash_area_id}  section=${section}  


*** Keywords ***
post car wash car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post car wash car positions  &{kwargs}
   expect status is 403  ${resp}  

get car wash car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car positions  &{kwargs}
   expect status is 403  ${resp}  

get car wash new car positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash new car positions  &{kwargs}
   expect status is 403  ${resp}  

