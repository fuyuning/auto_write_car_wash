*** Settings ***
Documentation  admin_wash_able_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_able_group.WashAbleGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_able_group  虾洗后台


*** Test Cases ***
Get Admin Wash Able Groups Success 
   [Documentation]  接口名:用户建团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AutoWashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Able Groups Success 200  ${essential_params}  ${unessential_params}

Get Admin Wash Able Groups Fail With Wrong Params
   [Documentation]  接口名:用户建团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Able Groups Fail 422  ${essential_params}  ${unessential_params}

Get Admin Wash Able Groups By Wash Auto Group Id Fail With Wrong Url
   [Documentation]  接口名:查询用户建团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Wash Able Groups By Wash Auto Group Id Fail 404  wash_auto_group_id=${wrong_url_id}

Get Admin Wash Able Groups By Wash Auto Group Id Success 
   [Documentation]  接口名:查询用户建团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AutoWashGroup 对象。
   [Tags]           Respcode:200
   Get Admin Wash Able Groups By Wash Auto Group Id Success 200  wash_auto_group_id=${wash_auto_group_id}

Put Admin Wash Able Groups By Wash Able Group Id Fail With Wrong Params
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  day_in_week=${day_in_week}  car_washers=${car_washers}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  spec_people_day_num=${spec_people_day_num}  auto_group=False  
   run every case by params  Put Admin Wash Able Groups By Wash Able Group Id Fail 422  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}

Put Admin Wash Able Groups By Wash Able Group Id Success 
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  day_in_week=${day_in_week}  car_washers=${car_washers}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  spec_people_day_num=${spec_people_day_num}  auto_group=False  
   run every case by params  Put Admin Wash Able Groups By Wash Able Group Id Success 204  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}

Put Admin Wash Able Groups By Wash Able Group Id Fail With Wrong Url
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  day_in_week=${day_in_week}  car_washers=${car_washers}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  spec_people_day_num=${spec_people_day_num}  auto_group=False  
   run every case by params  Put Admin Wash Able Groups By Wash Able Group Id Fail 404  ${essential_params}  ${unessential_params}  wash_able_group_id=${wrong_url_id}

Patch Admin Wash Able Group By Wash Able Group Id Success 
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Able Group By Wash Able Group Id Success 204  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}

Patch Admin Wash Able Group By Wash Able Group Id Fail With Wrong Url
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Able Group By Wash Able Group Id Fail 404  ${essential_params}  ${unessential_params}  wash_able_group_id=${wrong_url_id}

Patch Admin Wash Able Group By Wash Able Group Id Fail With Wrong Params
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch Admin Wash Able Group By Wash Able Group Id Fail 422  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}


*** Variables ***
${wash_auto_group_id}  
${wash_able_group_id}  


*** Keywords ***
Get Admin Wash Able Groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Able Groups   &{kwargs}
   expect status is 200  ${resp}  admin_wash_able_group/Get_Admin_Wash_Able_Groups_200.json
   ${wash_auto_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_auto_group_id]}
   set global variable   ${wash_auto_group_id}
   ${wash_able_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_able_group_id]}
   set global variable   ${wash_able_group_id}

Get Admin Wash Able Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Able Groups   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wash Able Groups By Wash Auto Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Able Groups By Wash Auto Group Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Wash Able Groups By Wash Auto Group Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Able Groups By Wash Auto Group Id   &{kwargs}
   expect status is 200  ${resp}  admin_wash_able_group/Get_Admin_Wash_Able_Groups_By_Wash_Auto_Group_Id_200.json
   ${wash_auto_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_auto_group_id]}
   set global variable   ${wash_auto_group_id}
   ${wash_able_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_able_group_id]}
   set global variable   ${wash_able_group_id}

Put Admin Wash Able Groups By Wash Able Group Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Able Groups By Wash Able Group Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Wash Able Groups By Wash Able Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Able Groups By Wash Able Group Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Wash Able Groups By Wash Able Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Able Groups By Wash Able Group Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Admin Wash Able Group By Wash Able Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Able Group By Wash Able Group Id   &{kwargs}
   expect status is 204  ${resp}  

Patch Admin Wash Able Group By Wash Able Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Able Group By Wash Able Group Id   &{kwargs}
   expect status is 404  ${resp}  

Patch Admin Wash Able Group By Wash Able Group Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Patch Admin Wash Able Group By Wash Able Group Id   &{kwargs}
   expect status is 422  ${resp}  

