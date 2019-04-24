*** Settings ***
Documentation  admin_car_position
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_position.CarPositionLibrary
Force Tags  model:admin_car_position  虾洗后台


*** Test Cases ***
Post car Positions import Fail Without Login
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Post car Positions import Fail 403

Post car Positions manual Fail Without Login
   [Documentation]  接口名:手动添加车辆位置${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Post car Positions manual Fail 403  ${essential_params}  ${unessential_params}

Get Admin Car Positions Fail Without Login
   [Documentation]  接口名:车辆位置列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Positions Fail 403  ${essential_params}  ${unessential_params}

Get car Postion Id Fail Without Login
   [Documentation]  接口名:车辆位置详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get car Postion Id Fail 403  /car_postion_id=${/car_postion_id}

Put Admin Car Positions By Car Position Id Fail Without Login
   [Documentation]  接口名:修改车辆位置${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  parking_id=${parking_id}  
   ${unessential_params}  create list  wash_area_id=${wash_area_id}  entry_time=${entry_time}  lon=${lon}  lat=${lat}  phase=${phase}  floor=${floor}  zone=${zone}  space_no=${space_no}  ownership=${ownership}  
   run every case by params  Put Admin Car Positions By Car Position Id Fail 403  ${essential_params}  ${unessential_params}  car_position_id=${car_position_id}

Delete Admin Car Positions By Car Position Id Fail Without Login
   [Documentation]  接口名:删除车辆位置${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Car Positions By Car Position Id Fail 403  car_position_id=${car_position_id}


*** Variables ***
${/car_postion_id}
${car_position_id}


*** Keywords ***
Post car Positions import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post car Positions import   &{kwargs}
   expect status is 403  ${resp}  

Post car Positions manual Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post car Positions manual   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Car Positions Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Positions   &{kwargs}
   expect status is 403  ${resp}  

Get car Postion Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get car Postion Id   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Car Positions By Car Position Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Positions By Car Position Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Car Positions By Car Position Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Car Positions By Car Position Id   &{kwargs}
   expect status is 403  ${resp}  

