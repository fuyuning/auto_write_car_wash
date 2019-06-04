*** Settings ***
Documentation  admin_wash_auto_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_auto_group.WashAutoGroupLibrary
Force Tags  model:admin_wash_auto_group  虾洗后台


*** Test Cases ***
get admin wash auto groups Fail Without Login
   [Documentation]  接口名:建团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash auto groups fail 403     page_num=${page_num}  page_size=${page_size}  

get admin wash auto groups by wash auto group id Fail Without Login
   [Documentation]  接口名:查询自动建团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash auto groups by wash auto group id fail 403     wash_auto_group_id=${wash_auto_group_id}

put admin wash auto groups by wash auto group id Fail Without Login
   [Documentation]  接口名:更新自动建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin wash auto groups by wash auto group id fail 403     wash_auto_group_id=${wash_auto_group_id}  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}    day_in_week=${day_in_week}  car_washers=${car_washers}  is_auto_robot=False  auto_group=False  subscribe=False  subscribe_name=${subscribe_name}  subscribe_day_num=${subscribe_day_num}  subscribe_expect_time=${subscribe_expect_time}  subscribe_expect_day=${subscribe_expect_day}  

patch admin wash auto group by wash auto group id Fail Without Login
   [Documentation]  接口名:添加更改启用状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash auto group by wash auto group id fail 403     wash_auto_group_id=${wash_auto_group_id}  status=${status}    


*** Variables ***
${wash_auto_group_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin wash auto groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash auto groups  &{kwargs}
   expect status is 403  ${resp}  

get admin wash auto groups by wash auto group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash auto groups by wash auto group id  &{kwargs}
   expect status is 403  ${resp}  

put admin wash auto groups by wash auto group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash auto groups by wash auto group id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash auto group by wash auto group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash auto group by wash auto group id  &{kwargs}
   expect status is 403  ${resp}  

