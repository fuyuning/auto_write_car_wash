*** Settings ***
Documentation  admin_car_info
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_info.CarInfoLibrary
Force Tags  model:admin_car_info  虾洗后台


*** Test Cases ***
post admin car infos import Fail Without Login
   [Documentation]  接口名:文件上传${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    post admin car infos import fail 403

get admin car infos Fail Without Login
   [Documentation]  接口名:车辆信息列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car infos fail 403     car_id=${car_id}  car_type=${car_type}  page_num=${page_num}  page_size=${page_size}  

get admin car infos by car info id Fail Without Login
   [Documentation]  接口名:车辆信息详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin car infos by car info id fail 403     car_info_id=${car_info_id}

put admin car infos by car info id Fail Without Login
   [Documentation]  接口名:修改车辆信息${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin car infos by car info id fail 403     car_info_id=${car_info_id}  car_id=${car_id}    car_model=${car_model}  car_brand=${car_brand}  car_series=${car_series}  car_color=${car_color}  car_frame_no=${car_frame_no}  licensed_time=${licensed_time}  car_year=${car_year}  car_images=${car_images}  car_tire_pressure=${car_tire_pressure}  description=${description}  tag=${tag}  


*** Variables ***
${car_info_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin car infos import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin car infos import  &{kwargs}
   expect status is 403  ${resp}  

get admin car infos Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car infos  &{kwargs}
   expect status is 403  ${resp}  

get admin car infos by car info id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car infos by car info id  &{kwargs}
   expect status is 403  ${resp}  

put admin car infos by car info id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin car infos by car info id  &{kwargs}
   expect status is 403  ${resp}  

