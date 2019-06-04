*** Settings ***
Documentation  wxmp_car_series
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.car_series.CarSeriesLibrary
Force Tags  model:wxmp_car_series  车主微信端


*** Test Cases ***
get car series Fail Without Login
   [Documentation]  接口名:车系列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get car series fail 403     brand_id=${brand_id}  car_series_name=${car_series_name}  page_num=${page_num}  page_size=${page_size}  


*** Keywords ***
get car series Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get car series  &{kwargs}
   expect status is 403  ${resp}  

