*** Settings ***
Documentation  admin_wash_able_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_able_group.WashAbleGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_able_group  虾洗后台


*** Test Cases ***
Get wash_able_group Fail Without Login
   [Documentation]  接口名:用户建团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash able groups Fail 403  ${essential_params}  ${unessential_params}



Get wash_able_group Success 
   [Documentation]  接口名:用户建团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AutoWashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash able groups Success 200  ${essential_params}  ${unessential_params}



Get wash_able_group Fail With Wrong Params
   [Documentation]  接口名:用户建团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash able groups Fail 422  ${essential_params}  ${unessential_params}



Get wash_able_group By Id Fail With Wrong Url
   [Documentation]  接口名:查询用户建团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin wash able groups By Id Fail 404  wash_auto_group_id=${wrong_url_id}



Get wash_able_group By Id Fail Without Login
   [Documentation]  接口名:查询用户建团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin wash able groups By Id Fail 403  wash_auto_group_id=${wash_auto_group_id}



Get wash_able_group By Id Success 
   [Documentation]  接口名:查询用户建团${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 AutoWashGroup 对象。
   [Tags]           Respcode:200
   Get admin wash able groups By Id Success 200  wash_auto_group_id=${wash_auto_group_id}



Put wash_able_group By Id Success 
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  day_in_week=${day_in_week}  car_washers=${car_washers}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  spec_people_day_num=${spec_people_day_num}  auto_group=False  
   run every case by params  Put admin wash able groups By Id Success 204  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}



Put wash_able_group By Id Fail With Wrong Params
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  day_in_week=${day_in_week}  car_washers=${car_washers}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  spec_people_day_num=${spec_people_day_num}  auto_group=False  
   run every case by params  Put admin wash able groups By Id Fail 422  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}



Put wash_able_group By Id Fail Without Login
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  day_in_week=${day_in_week}  car_washers=${car_washers}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  spec_people_day_num=${spec_people_day_num}  auto_group=False  
   run every case by params  Put admin wash able groups By Id Fail 403  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}



Put wash_able_group By Id Fail With Wrong Url
   [Documentation]  接口名:更新用户建团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  name=${name}  group_time_range=${group_time_range}  expect_time=${expect_time}  expect_day=${expect_day}  is_diff_car_type=False  people_num=${people_num}  people_day_num=${people_day_num}  service_groups=${service_groups}  status=${status}  start_time=${start_time}  end_time=${end_time}  day_in_week=${day_in_week}  car_washers=${car_washers}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  spec_people_day_num=${spec_people_day_num}  auto_group=False  
   run every case by params  Put admin wash able groups By Id Fail 404  ${essential_params}  ${unessential_params}  wash_able_group_id=${wrong_url_id}



Patch wash_able_group By Id Success 
   [Documentation]  接口名:添加更改启用状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash able group By Id Success 204  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}



Patch wash_able_group By Id Fail Without Login
   [Documentation]  接口名:添加更改启用状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash able group By Id Fail 403  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}



Patch wash_able_group By Id Fail With Wrong Url
   [Documentation]  接口名:添加更改启用状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash able group By Id Fail 404  ${essential_params}  ${unessential_params}  wash_able_group_id=${wrong_url_id}



Patch wash_able_group By Id Fail With Wrong Params
   [Documentation]  接口名:添加更改启用状态${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  Patch admin wash able group By Id Fail 422  ${essential_params}  ${unessential_params}  wash_able_group_id=${wash_able_group_id}



*** Variables ***
${wash_auto_group_id}
${wash_able_group_id}


*** Keywords ***
Get Admin wash able groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash able groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups   &{kwargs}
   expect status is 200  ${resp}  admin_wash_able_group/Get_Admin_wash_able_groups_200.json
   ${wash_auto_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_auto_group_id]}
   set global variable   ${wash_auto_group_id}
   ${wash_able_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_able_group_id]}
   set global variable   ${wash_able_group_id}

Get Admin wash able groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups   &{kwargs}
   expect status is 422  ${resp}  

Get Admin wash able groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups by wash auto group id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin wash able groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups by wash auto group id  &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash able groups By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash able groups by wash auto group id  &{kwargs}
   expect status is 200  ${resp}  admin_wash_able_group/Get_Admin_wash_able_groups_By_Id_200.json
   ${wash_auto_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_auto_group_id]}
   set global variable   ${wash_auto_group_id}
   ${wash_able_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_able_group_id]}
   set global variable   ${wash_able_group_id}

Put Admin wash able groups By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash able groups by wash able group id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin wash able groups By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash able groups by wash able group id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin wash able groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash able groups by wash able group id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin wash able groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash able groups by wash able group id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin wash able group By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able group by wash able group id  &{kwargs}
   expect status is 204  ${resp}  

Patch Admin wash able group By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able group by wash able group id  &{kwargs}
   expect status is 403  ${resp}  

Patch Admin wash able group By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able group by wash able group id  &{kwargs}
   expect status is 404  ${resp}  

Patch Admin wash able group By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash able group by wash able group id  &{kwargs}
   expect status is 422  ${resp}  

