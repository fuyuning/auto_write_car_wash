*** Settings ***
Documentation  admin_car_info
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_info.CarInfoLibrary
Force Tags  model:admin_car_info  虾洗后台


*** Test Cases ***
Post car Infos import Fail Without Login
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    Post car Infos import Fail 403

Get Admin Car Infos Fail Without Login
   [Documentation]  接口名:车辆信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  car_id=${car_id}  car_type=${car_type}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Car Infos Fail 403  ${essential_params}  ${unessential_params}

Get Admin Car Infos By Car Info Id Fail Without Login
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Car Infos By Car Info Id Fail 403  car_info_id=${car_info_id}

Put Admin Car Infos By Car Info Id Fail Without Login
   [Documentation]  接口名:修改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  car_id=${car_id}  
   ${unessential_params}  create list  car_type=${car_type}  car_brand=${car_brand}  car_series=${car_series}  car_color=${car_color}  car_frame_no=${car_frame_no}  licensed_time=${licensed_time}  car_year=${car_year}  car_images=${car_images}  car_tire_pressure=${car_tire_pressure}  description=${description}  
   run every case by params  Put Admin Car Infos By Car Info Id Fail 403  ${essential_params}  ${unessential_params}  car_info_id=${car_info_id}


*** Variables ***
${car_info_id}


*** Keywords ***
Post car Infos import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post car Infos import   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Car Infos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Infos   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Car Infos By Car Info Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Car Infos By Car Info Id   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Car Infos By Car Info Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Car Infos By Car Info Id   &{kwargs}
   expect status is 403  ${resp}  

