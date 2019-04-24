*** Settings ***
Documentation  admin_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_normal.WashNormalLibrary
Force Tags  model:admin_wash_normal  虾洗后台


Get Admin Wash Normals By Wash Normal Id Fail Without Login
   [Documentation]  接口名:查询单个单买${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Wash Normals By Wash Normal Id Fail 403  wash_normal_id=${wash_normal_id}

Get Admin Wash Normals Fail Without Login
   [Documentation]  接口名:查询单买列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Normals Fail 403  ${essential_params}  ${unessential_params}

Put Admin Wash Normals By Wash Normal Id Fail Without Login
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}  day_in_week=${day_in_week}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  spec_people_day_num=${spec_people_day_num}  
   run every case by params  Put Admin Wash Normals By Wash Normal Id Fail 403  ${essential_params}  ${unessential_params}  wash_normal_id=${wash_normal_id}

Put Admin Wash Normals By Wash Normal Id Fail Without Login
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}  
   ${unessential_params}  create list  expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  
   run every case by params  Put Admin Wash Normals By Wash Normal Id Fail 403  ${essential_params}  ${unessential_params}  wash_normal_id=${wash_normal_id}

Patch Admin Wash Normal By Wash Normal Id Fail Without Login
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Normal By Wash Normal Id Fail 403  ${essential_params}  ${unessential_params}  wash_normal_id=${wash_normal_id}

Get Admin Wash Normals By Wash Normal Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Normals By Wash Normal Id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash Normals Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Normals   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Wash Normals By Wash Normal Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Normals By Wash Normal Id   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Wash Normals By Wash Normal Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Normals By Wash Normal Id   &{kwargs}
   expect status is 403  ${resp}  

Patch Admin Wash Normal By Wash Normal Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Normal By Wash Normal Id   &{kwargs}
   expect status is 403  ${resp}  

