*** Settings ***
Documentation  admin_wash_normal
Resource  ../resources.robot
Library  robot_car_wash_server_library.wash_normal.WashNormalLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_wash_normal  虾洗后台


*** Test Cases ***
get admin wash normals by wash normal id Fail With Wrong Url
   [Documentation]  接口名:查询单个单买${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin wash normals by wash normal id Fail 404    wash_normal_id=${w}

get admin wash normals by wash normal id Success 
   [Documentation]  接口名:查询单个单买${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashNormal 对象。
   [Tags]           Respcode:200
   get admin wash normals by wash normal id Success 200    wash_normal_id=${wash_normal_id}

get admin wash normals Success 
   [Documentation]  接口名:查询单买列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 WashNormal 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin wash normals Success 200  ${essential_params}  ${unessential_params}

get admin wash normals Fail With Wrong Params
   [Documentation]  接口名:查询单买列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin wash normals Fail 422  ${essential_params}  ${unessential_params}  success=False

put admin wash normals by wash normal id Fail With Wrong Url
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}  day_in_week=${day_in_week}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  spec_people_day_num=${spec_people_day_num}  
   run every case by params  put admin wash normals by wash normal id Fail 404  ${essential_params}  ${unessential_params}    wash_normal_id=${w}

put admin wash normals by wash normal id Fail With Wrong Params
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  start_time=${start_time_422}  end_time=${end_time_422}  is_diff_car_type=ThisIsRobot!  people_day_num=${people_day_num_422}  expect_type=${expect_type_422}  car_washer_ids=${Please_input}  service_groups=${service_groups_422}  day_in_week=${day_in_week_422}  time_loop_set=${time_loop_set_422}  
   ${unessential_params}  create list  expect_time=${expect_time_422}  expect_day=${expect_day_422}  expect_hour=${expect_hour_422}  spec_people_day_num=${spec_people_day_num_422}  
   run every case by params  put admin wash normals by wash normal id Fail 422  ${essential_params}  ${unessential_params}    wash_normal_id=${wash_normal_id}  success=False

put admin wash normals by wash normal id Success 
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}  day_in_week=${day_in_week}  time_loop_set=${time_loop_set}  
   ${unessential_params}  create list  expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  spec_people_day_num=${spec_people_day_num}  
   run every case by params  put admin wash normals by wash normal id Success 204  ${essential_params}  ${unessential_params}    wash_normal_id=${wash_normal_id}

put admin wash normals by wash normal id Fail With Wrong Url
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}  
   ${unessential_params}  create list  expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  
   run every case by params  put admin wash normals by wash normal id Fail 404  ${essential_params}  ${unessential_params}    wash_normal_id=${w}

put admin wash normals by wash normal id Fail With Wrong Params
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  start_time=${start_time_422}  end_time=${end_time_422}  is_diff_car_type=ThisIsRobot!  people_day_num=${people_day_num_422}  expect_type=${expect_type_422}  car_washer_ids=${Please_input}  service_groups=${service_groups_422}  
   ${unessential_params}  create list  expect_time=${expect_time_422}  expect_day=${expect_day_422}  expect_hour=${expect_hour_422}  
   run every case by params  put admin wash normals by wash normal id Fail 422  ${essential_params}  ${unessential_params}    wash_normal_id=${wash_normal_id}  success=False

put admin wash normals by wash normal id Success 
   [Documentation]  接口名:编辑单买${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  start_time=${start_time}  end_time=${end_time}  is_diff_car_type=False  people_day_num=${people_day_num}  expect_type=${expect_type}  car_washer_ids=${Please_input}  service_groups=${service_groups}  
   ${unessential_params}  create list  expect_time=${expect_time}  expect_day=${expect_day}  expect_hour=${expect_hour}  
   run every case by params  put admin wash normals by wash normal id Success 204  ${essential_params}  ${unessential_params}    wash_normal_id=${wash_normal_id}

patch admin wash normal by wash normal id Success 
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash normal by wash normal id Success 204  ${essential_params}  ${unessential_params}    wash_normal_id=${wash_normal_id}

patch admin wash normal by wash normal id Fail With Wrong Url
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash normal by wash normal id Fail 404  ${essential_params}  ${unessential_params}    wash_normal_id=${w}

patch admin wash normal by wash normal id Fail With Wrong Params
   [Documentation]  接口名:改人数${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  spec_people_day_num=${spec_people_day_num_422}  
   ${unessential_params}  create list  
   run every case by params  patch admin wash normal by wash normal id Fail 422  ${essential_params}  ${unessential_params}    wash_normal_id=${wash_normal_id}  success=False


*** Variables ***
${wash_normal_id}  


*** Keywords ***
get admin wash normals by wash normal id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash normals by wash normal id  &{kwargs}
   expect status is 404  ${resp}  

get admin wash normals by wash normal id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash normals by wash normal id  &{kwargs}
   expect status is 200  ${resp}  admin_wash_normal/get_admin_wash_normals_by_wash_normal_id_200.json
   ${wash_normal_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_normal_id]}
   set global variable   ${wash_normal_id}

get admin wash normals Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash normals  &{kwargs}
   expect status is 200  ${resp}  admin_wash_normal/get_admin_wash_normals_200.json
   ${wash_normal_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][wash_normal_id]}
   set global variable   ${wash_normal_id}

get admin wash normals Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin wash normals  &{kwargs}
   expect status is 422  ${resp}  

put admin wash normals by wash normal id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 404  ${resp}  

put admin wash normals by wash normal id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 422  ${resp}  

put admin wash normals by wash normal id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 204  ${resp}  

put admin wash normals by wash normal id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 404  ${resp}  

put admin wash normals by wash normal id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 422  ${resp}  

put admin wash normals by wash normal id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin wash normals by wash normal id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash normal by wash normal id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash normal by wash normal id  &{kwargs}
   expect status is 204  ${resp}  

patch admin wash normal by wash normal id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash normal by wash normal id  &{kwargs}
   expect status is 404  ${resp}  

patch admin wash normal by wash normal id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin wash normal by wash normal id  &{kwargs}
   expect status is 422  ${resp}  

