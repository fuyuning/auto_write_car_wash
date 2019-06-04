*** Settings ***
Documentation  admin_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_normal.WashNormalLibrary
Force Tags  model:admin_wash_normal  虾洗后台


*** Test Cases ***
get admin wash normals by wash normal id Fail Without Login
   [Documentation]  接口名:查询单个单买${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash normals by wash normal id fail 403     wash_normal_id=${wash_normal_id}

get admin wash normals Fail Without Login
   [Documentation]  接口名:查询单买列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin wash normals fail 403     page_num=${page_num}  page_size=${page_size}  

put admin wash normals by wash normal id Fail Without Login
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin wash normals by wash normal id fail 403     wash_normal_id=${wash_normal_id}  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}  time_loop_set=${time_loop_set}    expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  day_in_week=${day_in_week}  spec_people_day_num=${spec_people_day_num}  

put admin wash normals by wash normal id Fail Without Login
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin wash normals by wash normal id fail 403     wash_normal_id=${wash_normal_id}  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}    expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  

patch admin wash normals by wash normal id Fail Without Login
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin wash normals by wash normal id fail 403     wash_normal_id=${wash_normal_id}  spec_people_day_num=${spec_people_day_num}    


*** Variables ***
${wash_normal_id}  1a2b3c4d5e6f7zz


*** Keywords ***
get admin wash normals by wash normal id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash normals by wash normal id  &{kwargs}
   expect status is 403  ${resp}  

get admin wash normals Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash normals  &{kwargs}
   expect status is 403  ${resp}  

put admin wash normals by wash normal id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 403  ${resp}  

put admin wash normals by wash normal id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 403  ${resp}  

patch admin wash normals by wash normal id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash normals by wash normal id  &{kwargs}
   expect status is 403  ${resp}  

