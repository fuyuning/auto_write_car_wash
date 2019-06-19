*** Settings ***
Documentation  app_car_series
Resource  ../resources.robot
Library  robot_washing_expert_library.car_series.CarSeriesLibrary
Force Tags  model:app_car_series  虾客APP


*** Test Cases ***
get car wash car series Fail Without Login
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash car series fail 403     brand_id=${brand_id}  car_series_name=${car_series_name}  page_num=${page_num}  page_size=${page_size}  

get car wash car series money Fail Without Login
   [Documentation]  接口名:车系算钱${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car wash car series money fail 403   parking_id=${parking_id}    series_id=${series_id}  


*** Keywords ***
get car wash car series Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car series  &{kwargs}
   expect status is 403  ${resp}  

get car wash car series money Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car wash car series money  &{kwargs}
   expect status is 403  ${resp}  

