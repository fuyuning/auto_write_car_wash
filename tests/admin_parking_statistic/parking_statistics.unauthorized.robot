*** Settings ***
Documentation  admin_parking_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.parking_statistic.ParkingStatisticLibrary
Force Tags  model:admin_parking_statistic  虾洗后台


*** Test Cases ***
get admin parking statistics by day Fail Without Login
   [Documentation]  接口名:停车场统计${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin parking statistics by day fail 403     order_by=${order_by}  section=${section}  page_num=${page_num}  page_size=${page_size}  

patch admin parking statistics by day visible by parking statistic id Fail Without Login
   [Documentation]  接口名:停车场数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin parking statistics by day visible by parking statistic id fail 403     parking_statistic_id=${parking_statistic_id}  visible=False    


*** Variables ***
${parking_statistic_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin parking statistics by day Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin parking statistics by day  &{kwargs}
   expect status is 403  ${resp}  

patch admin parking statistics by day visible by parking statistic id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin parking statistics by day visible by parking statistic id  &{kwargs}
   expect status is 403  ${resp}  

