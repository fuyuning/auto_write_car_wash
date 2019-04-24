*** Settings ***
Documentation  admin_wash_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_group.WashGroupLibrary
Force Tags  model:admin_wash_group  虾洗后台


*** Test Cases ***
Post Admin Wash Groups Fail Without Login
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  people_num=${people_num}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  auto_group=False  
   run every case by params  Post Admin Wash Groups Fail 403  ${essential_params}  ${unessential_params}

Post Join By Wash Group Id Fail Without Login
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post Join By Wash Group Id Fail 403  ${essential_params}  ${unessential_params}  wash_group_id/join=${wash_group_id/join}

Get Admin Wash Groups By Wash Group Id Fail Without Login
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Admin Wash Groups By Wash Group Id Fail 403  wash_group_id=${wash_group_id}

Get Admin Wash Groups Fail Without Login
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_group_no=${wash_group_no}  status=${status}  wash_area_id=${wash_area_id}  valid_start_section=${valid_start_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Groups Fail 403  ${essential_params}  ${unessential_params}

Put Admin Wash Groups By Wash Group Id Fail Without Login
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put Admin Wash Groups By Wash Group Id Fail 403  ${essential_params}  ${unessential_params}  wash_group_id=${wash_group_id}


*** Variables ***
${wash_group_id/join}  12345678909876543
${wash_group_id}  12345678909876543


*** Keywords ***
Post Admin Wash Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash Groups   &{kwargs}
   expect status is 403  ${resp}  

Post Join By Wash Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Join By Wash Group Id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash Groups By Wash Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Groups By Wash Group Id   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Wash Groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Groups   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Wash Groups By Wash Group Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Groups By Wash Group Id   &{kwargs}
   expect status is 403  ${resp}  

