*** Settings ***
Documentation  admin_wash_able_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_able_group.WashAbleGroupLibrary
Force Tags  model:admin_wash_able_group  虾洗后台


*** Test Cases ***
get admin wash able groups Fail Without Login
   [Documentation]  接口名:用户建团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash able groups fail 403     page_num=${page_num}  page_size=${page_size}  

get admin wash able groups by wash auto group id Fail Without Login
   [Documentation]  接口名:查询用户建团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash able groups by wash auto group id fail 403     wash_auto_group_id=${wash_auto_group_id}

put admin wash able groups by wash able group id Fail Without Login
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin wash able groups by wash able group id fail 403     wash_able_group_id=${wash_able_group_id}  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  car_washer_ids=${car_washer_ids}  time_loop_set=${time_loop_set}    day_in_week=${day_in_week}  spec_people_day_num=${spec_people_day_num}  auto_group=False  end_time_found=False  

patch admin wash able groups by wash able group id Fail Without Login
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash able groups by wash able group id fail 403     wash_able_group_id=${wash_able_group_id}  spec_people_day_num=${spec_people_day_num}    


*** Variables ***
${wash_auto_group_id}  1a2b3c4d5e6f7zz
${wash_able_group_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin wash able groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups  &{kwargs}
   expect status is 403  ${resp}  

get admin wash able groups by wash auto group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups by wash auto group id  &{kwargs}
   expect status is 403  ${resp}  

put admin wash able groups by wash able group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash able groups by wash able group id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash able groups by wash able group id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able groups by wash able group id  &{kwargs}
   expect status is 403  ${resp}  

