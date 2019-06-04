*** Settings ***
Documentation  admin_wash_group
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_group.WashGroupLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_wash_group  虾洗后台


*** Test Cases ***
post admin wash groups Fail With Wrong Params
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  name=${name_422}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=ThisIsRobot!  service_groups=${service_groups_422}  people_num=${people_num_422}  wash_area_id=${wash_area_id_422}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids_422}  
   ${unessential_params}  create dictionary  auto_group=ThisIsRobot!  
   run every case by params   post admin wash groups fail 422   ${essential_params}  ${unessential_params}  success=False

post admin wash groups Success 
   [Documentation]  接口名:新增拼团${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  name=${name}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${service_groups}  people_num=${people_num}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create dictionary  auto_group=False  
   run every case by params   post admin wash groups success 201   ${essential_params}  ${unessential_params}

post admin wash groups join by wash group id Fail With Wrong Url
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post admin wash groups join by wash group id fail 404     wash_group_id=${wrong_url_id}  robot_num=${robot_num}    

post admin wash groups join by wash group id Fail With Wrong Params
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  robot_num=${robot_num_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin wash groups join by wash group id fail 422   ${essential_params}  ${unessential_params}    wash_group_id=${wash_group_id}  success=False

post admin wash groups join by wash group id Success 
   [Documentation]  接口名:一键虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  robot_num=${robot_num}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin wash groups join by wash group id success 201   ${essential_params}  ${unessential_params}    wash_group_id=${wash_group_id}

get admin wash groups by wash group id Fail With Wrong Url
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin wash groups by wash group id fail 404     wash_group_id=${wrong_url_id}

get admin wash groups by wash group id Success 
   [Documentation]  接口名:获取拼团详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 对象。
   [Tags]           Respcode:200
   get admin wash groups by wash group id success 200     wash_group_id=${wash_group_id}

get admin wash groups Success 
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashGroup 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_group_no=${wash_group_no}  status=${status}  wash_area_id=${wash_area_id}  valid_start_section=${valid_start_section}  page_num=${page_num}  page_size=${page_size}  
   run every case by params   get admin wash groups success 200   ${essential_params}  ${unessential_params}

get admin wash groups Fail With Wrong Params
   [Documentation]  接口名:获取拼团列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_group_no=${wash_group_no_422}  status=${status_422}  wash_area_id=${wash_area_id_422}  valid_start_section=${valid_start_section_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params   get admin wash groups fail 422   ${essential_params}  ${unessential_params}  success=False

put admin wash groups by wash group id Fail With Wrong Url
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin wash groups by wash group id fail 404     wash_group_id=${wrong_url_id}  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${service_groups}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}    name=${name}  people_num=${people_num}  auto_group=False  

put admin wash groups by wash group id Fail With Wrong Params
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=ThisIsRobot!  service_groups=${service_groups_422}  wash_area_id=${wash_area_id_422}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids_422}  
   ${unessential_params}  create dictionary  name=${name_422}  people_num=${people_num_422}  auto_group=ThisIsRobot!  
   run every case by params   put admin wash groups by wash group id fail 422   ${essential_params}  ${unessential_params}    wash_group_id=${wash_group_id}  success=False

put admin wash groups by wash group id Success 
   [Documentation]  接口名:编辑拼团${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  valid_start_time=${Please_input}  valid_end_time=${Please_input}  is_diff_car_type=False  service_groups=${service_groups}  wash_area_id=${wash_area_id}  expect_time=${Please_input}  car_washer_ids=${car_washer_ids}  
   ${unessential_params}  create dictionary  name=${name}  people_num=${people_num}  auto_group=False  
   run every case by params   put admin wash groups by wash group id success 204   ${essential_params}  ${unessential_params}    wash_group_id=${wash_group_id}


*** Variables ***
${wash_group_id}  


*** Keywords ***
post admin wash groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups  &{kwargs}
   expect status is 422  ${resp}  

post admin wash groups Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups  &{kwargs}
   expect status is 201  ${resp}  admin_wash_group/post_admin_wash_groups_201.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_group_id']}
   set global variable   ${wash_group_id}

post admin wash groups join by wash group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups join by wash group id  &{kwargs}
   expect status is 404  ${resp}  

post admin wash groups join by wash group id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups join by wash group id  &{kwargs}
   expect status is 422  ${resp}  

post admin wash groups join by wash group id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin wash groups join by wash group id  &{kwargs}
   expect status is 201  ${resp}  admin_wash_group/post_admin_wash_groups_join_by_wash_group_id_201.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_group_id']}
   set global variable   ${wash_group_id}

get admin wash groups by wash group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups by wash group id  &{kwargs}
   expect status is 404  ${resp}  

get admin wash groups by wash group id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups by wash group id  &{kwargs}
   expect status is 200  ${resp}  admin_wash_group/get_admin_wash_groups_by_wash_group_id_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_group_id']}
   set global variable   ${wash_group_id}

get admin wash groups Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups  &{kwargs}
   expect status is 200  ${resp}  admin_wash_group/get_admin_wash_groups_200.json
   ${wash_group_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['wash_group_id']}
   set global variable   ${wash_group_id}

get admin wash groups Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash groups  &{kwargs}
   expect status is 422  ${resp}  

put admin wash groups by wash group id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash groups by wash group id  &{kwargs}
   expect status is 404  ${resp}  

put admin wash groups by wash group id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash groups by wash group id  &{kwargs}
   expect status is 422  ${resp}  

put admin wash groups by wash group id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash groups by wash group id  &{kwargs}
   expect status is 204  ${resp}  

