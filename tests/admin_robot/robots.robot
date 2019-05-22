*** Settings ***
Documentation  admin_robot
Resource  ../resources.robot
Library  robot_car_wash_server_library.robot.RobotLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_robot  虾洗后台


*** Test Cases ***
post admin robots Success 
   [Documentation]  接口名:新增虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_id=${car_id}  
   ${unessential_params}  create list  
   run every case by params  post admin robots Success 201  ${essential_params}  ${unessential_params}

post admin robots Fail With Wrong Params
   [Documentation]  接口名:新增虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mobile=${mobile_422}  name=${name_422}  car_id=${car_id_422}  
   ${unessential_params}  create list  
   run every case by params  post admin robots Fail 422  ${essential_params}  ${unessential_params}  success=False

get admin robots Success 
   [Documentation]  接口名:获取虾滑列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Robot 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin robots Success 200  ${essential_params}  ${unessential_params}

get admin robots Fail With Wrong Params
   [Documentation]  接口名:获取虾滑列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile_422}  car_id=${car_id_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin robots Fail 422  ${essential_params}  ${unessential_params}  success=False

delete admin robots cancel by robot id Fail With Wrong Url
   [Documentation]  接口名:删除虾滑${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin robots cancel by robot id Fail 404    robot_id=${wrong_url_id}

delete admin robots cancel by robot id Success 
   [Documentation]  接口名:删除虾滑${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin robots cancel by robot id Success 204    robot_id=${robot_id}


*** Variables ***
${robot_id}  


*** Keywords ***
post admin robots Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin robots  &{kwargs}
   expect status is 201  ${resp}  admin_robot/post_admin_robots_201.json
   ${robot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][robot_id]}
   set global variable   ${robot_id}

post admin robots Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin robots  &{kwargs}
   expect status is 422  ${resp}  

get admin robots Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin robots  &{kwargs}
   expect status is 200  ${resp}  admin_robot/get_admin_robots_200.json
   ${robot_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][robot_id]}
   set global variable   ${robot_id}

get admin robots Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin robots  &{kwargs}
   expect status is 422  ${resp}  

delete admin robots cancel by robot id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin robots cancel by robot id  &{kwargs}
   expect status is 404  ${resp}  

delete admin robots cancel by robot id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin robots cancel by robot id  &{kwargs}
   expect status is 204  ${resp}  

