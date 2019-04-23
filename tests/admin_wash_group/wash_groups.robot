*** Settings ***
Documentation  admin_wash_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_group.WashGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_group  虾洗后台


*** Test Cases ***
Post wash_group Success 
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  people_num=${people_num}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  auto_group=False  
   run every case by params  Post admin wash groups Success 201  ${essential_params}  ${unessential_params}



Post wash_group Fail With Wrong Params
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  people_num=${people_num}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  auto_group=False  
   run every case by params  Post admin wash groups Fail 422  ${essential_params}  ${unessential_params}



Post wash_group Fail Without Login
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  name=${name}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  people_num=${people_num}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  auto_group=False  
   run every case by params  Post admin wash groups Fail 403  ${essential_params}  ${unessential_params}



Post wash_group By Id Success 
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash groups By Id Success 204  ${essential_params}  ${unessential_params}  wash_group_id/join=${wash_group_id/join}



Post wash_group By Id Fail With Wrong Url
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash groups By Id Fail 404  ${essential_params}  ${unessential_params}  wash_group_id/join=${wrong_url_id}



Post wash_group By Id Fail With Wrong Params
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash groups By Id Fail 422  ${essential_params}  ${unessential_params}  wash_group_id/join=${wash_group_id/join}



Post wash_group By Id Fail Without Login
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post admin wash groups By Id Fail 403  ${essential_params}  ${unessential_params}  wash_group_id/join=${wash_group_id/join}



Get wash_group By Id Fail With Wrong Url
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get admin wash groups By Id Fail 404  wash_group_id=${wrong_url_id}



Get wash_group By Id Fail Without Login
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get admin wash groups By Id Fail 403  wash_group_id=${wash_group_id}



Get wash_group By Id Success 
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 对象。
   [Tags]           Respcode:200
   Get admin wash groups By Id Success 200  wash_group_id=${wash_group_id}



Get wash_group Fail Without Login
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_group_no=${wash_group_no}  status=${status}  wash_area_id=${wash_area_id}  valid_start_section=${valid_start_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash groups Fail 403  ${essential_params}  ${unessential_params}



Get wash_group Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_group_no=${wash_group_no}  status=${status}  wash_area_id=${wash_area_id}  valid_start_section=${valid_start_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash groups Success 200  ${essential_params}  ${unessential_params}



Get wash_group Fail With Wrong Params
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_group_no=${wash_group_no}  status=${status}  wash_area_id=${wash_area_id}  valid_start_section=${valid_start_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin wash groups Fail 422  ${essential_params}  ${unessential_params}



Put wash_group By Id Success 
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put admin wash groups By Id Success 204  ${essential_params}  ${unessential_params}  wash_group_id=${wash_group_id}



Put wash_group By Id Fail With Wrong Url
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put admin wash groups By Id Fail 404  ${essential_params}  ${unessential_params}  wash_group_id=${wrong_url_id}



Put wash_group By Id Fail With Wrong Params
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put admin wash groups By Id Fail 422  ${essential_params}  ${unessential_params}  wash_group_id=${wash_group_id}



Put wash_group By Id Fail Without Login
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put admin wash groups By Id Fail 403  ${essential_params}  ${unessential_params}  wash_group_id=${wash_group_id}



*** Variables ***
${wash_group_id/join}
${wash_group_id}


*** Keywords ***
Post Admin wash groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups   &{kwargs}
   expect status is 201  ${resp}  admin_wash_group/Post_Admin_wash_groups_201.json
   ${wash_group_id/join}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id/join]}
   set global variable   ${wash_group_id/join}
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Post Admin wash groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups   &{kwargs}
   expect status is 422  ${resp}  

Post Admin wash groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups   &{kwargs}
   expect status is 403  ${resp}  

Post Admin wash groups By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  post join by wash group id  &{kwargs}
   expect status is 204  ${resp}  

Post Admin wash groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post join by wash group id  &{kwargs}
   expect status is 404  ${resp}  

Post Admin wash groups By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post join by wash group id  &{kwargs}
   expect status is 422  ${resp}  

Post Admin wash groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post join by wash group id  &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups by wash group id  &{kwargs}
   expect status is 404  ${resp}  

Get Admin wash groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups by wash group id  &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash groups By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups by wash group id  &{kwargs}
   expect status is 200  ${resp}  admin_wash_group/Get_Admin_wash_groups_By_Id_200.json
   ${wash_group_id/join}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id/join]}
   set global variable   ${wash_group_id/join}
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get Admin wash groups Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups   &{kwargs}
   expect status is 403  ${resp}  

Get Admin wash groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups   &{kwargs}
   expect status is 200  ${resp}  admin_wash_group/Get_Admin_wash_groups_200.json
   ${wash_group_id/join}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id/join]}
   set global variable   ${wash_group_id/join}
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get Admin wash groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups   &{kwargs}
   expect status is 422  ${resp}  

Put Admin wash groups By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash groups by wash group id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin wash groups By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash groups by wash group id  &{kwargs}
   expect status is 404  ${resp}  

Put Admin wash groups By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash groups by wash group id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin wash groups By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash groups by wash group id  &{kwargs}
   expect status is 403  ${resp}  

