*** Settings ***
Documentation  admin_wash_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_group.WashGroupLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_group  虾洗后台


*** Test Cases ***
Post Admin Wash Groups Success 
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  name=${name}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  people_num=${people_num}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  auto_group=False  
   run every case by params  Post Admin Wash Groups Success 201  ${essential_params}  ${unessential_params}

Post Admin Wash Groups Fail With Wrong Params
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  name=${name}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  people_num=${people_num}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  auto_group=False  
   run every case by params  Post Admin Wash Groups Fail 422  ${essential_params}  ${unessential_params}

Post Join By Wash Group Id Success 
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post Join By Wash Group Id Success 204  ${essential_params}  ${unessential_params}  wash_group_id/join=${wash_group_id/join}

Post Join By Wash Group Id Fail With Wrong Url
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post Join By Wash Group Id Fail 404  ${essential_params}  ${unessential_params}  wash_group_id/join=${wrong_url_id}

Post Join By Wash Group Id Fail With Wrong Params
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  robot_num=${robot_num}  
   ${unessential_params}  create list  
   run every case by params  Post Join By Wash Group Id Fail 422  ${essential_params}  ${unessential_params}  wash_group_id/join=${wash_group_id/join}

Get Admin Wash Groups By Wash Group Id Fail With Wrong Url
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Admin Wash Groups By Wash Group Id Fail 404  wash_group_id=${wrong_url_id}

Get Admin Wash Groups By Wash Group Id Success 
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 对象。
   [Tags]           Respcode:200
   Get Admin Wash Groups By Wash Group Id Success 200  wash_group_id=${wash_group_id}

Get Admin Wash Groups Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_group_no=${wash_group_no}  status=${status}  wash_area_id=${wash_area_id}  valid_start_section=${valid_start_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Groups Success 200  ${essential_params}  ${unessential_params}

Get Admin Wash Groups Fail With Wrong Params
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_group_no=${wash_group_no}  status=${status}  wash_area_id=${wash_area_id}  valid_start_section=${valid_start_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Wash Groups Fail 422  ${essential_params}  ${unessential_params}

Put Admin Wash Groups By Wash Group Id Success 
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put Admin Wash Groups By Wash Group Id Success 204  ${essential_params}  ${unessential_params}  wash_group_id=${wash_group_id}

Put Admin Wash Groups By Wash Group Id Fail With Wrong Url
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put Admin Wash Groups By Wash Group Id Fail 404  ${essential_params}  ${unessential_params}  wash_group_id=${wrong_url_id}

Put Admin Wash Groups By Wash Group Id Fail With Wrong Params
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${Please_input}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create list  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params  Put Admin Wash Groups By Wash Group Id Fail 422  ${essential_params}  ${unessential_params}  wash_group_id=${wash_group_id}


*** Variables ***
${wash_group_id/join}
${wash_group_id}


*** Keywords ***
Post Admin Wash Groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash Groups   &{kwargs}
   expect status is 201  ${resp}  admin_wash_group/Post_Admin_Wash_Groups_201.json
   ${wash_group_id/join}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id/join]}
   set global variable   ${wash_group_id/join}
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Post Admin Wash Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Wash Groups   &{kwargs}
   expect status is 422  ${resp}  

Post Join By Wash Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Post Join By Wash Group Id   &{kwargs}
   expect status is 204  ${resp}  

Post Join By Wash Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Join By Wash Group Id   &{kwargs}
   expect status is 404  ${resp}  

Post Join By Wash Group Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Join By Wash Group Id   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Wash Groups By Wash Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Groups By Wash Group Id   &{kwargs}
   expect status is 404  ${resp}  

Get Admin Wash Groups By Wash Group Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Groups By Wash Group Id   &{kwargs}
   expect status is 200  ${resp}  admin_wash_group/Get_Admin_Wash_Groups_By_Wash_Group_Id_200.json
   ${wash_group_id/join}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id/join]}
   set global variable   ${wash_group_id/join}
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get Admin Wash Groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Groups   &{kwargs}
   expect status is 200  ${resp}  admin_wash_group/Get_Admin_Wash_Groups_200.json
   ${wash_group_id/join}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id/join]}
   set global variable   ${wash_group_id/join}
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_group_id]}
   set global variable   ${wash_group_id}

Get Admin Wash Groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Wash Groups   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Wash Groups By Wash Group Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Groups By Wash Group Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Wash Groups By Wash Group Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Groups By Wash Group Id   &{kwargs}
   expect status is 404  ${resp}  

Put Admin Wash Groups By Wash Group Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Wash Groups By Wash Group Id   &{kwargs}
   expect status is 422  ${resp}  

