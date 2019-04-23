*** Settings ***
Documentation  admin_robot
Resource  ../resources.robot
Library  robot_car_wash_server_library.robot.RobotLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_robot  虾洗后台


*** Test Cases ***
Post robot Fail Without Login
   [Documentation]  接口名:新增虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_id=${car_id}  
   ${unessential_params}  create list  
   run every case by params  Post admin robots Fail 403  ${essential_params}  ${unessential_params}



Post robot Success 
   [Documentation]  接口名:新增虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_id=${car_id}  
   ${unessential_params}  create list  
   run every case by params  Post admin robots Success 201  ${essential_params}  ${unessential_params}



Post robot Fail With Wrong Params
   [Documentation]  接口名:新增虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_id=${car_id}  
   ${unessential_params}  create list  
   run every case by params  Post admin robots Fail 422  ${essential_params}  ${unessential_params}



Get robot Fail Without Login
   [Documentation]  接口名:获取虾滑列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin robots Fail 403  ${essential_params}  ${unessential_params}



Get robot Success 
   [Documentation]  接口名:获取虾滑列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Robot 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin robots Success 200  ${essential_params}  ${unessential_params}



Get robot Fail With Wrong Params
   [Documentation]  接口名:获取虾滑列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin robots Fail 422  ${essential_params}  ${unessential_params}



Delete robot By Id Success 
   [Documentation]  接口名:删除虾滑${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin robots By Id Success 204  robot_id/cancel=${robot_id/cancel}



Delete robot By Id Fail With Wrong Url
   [Documentation]  接口名:删除虾滑${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin robots By Id Fail 404  robot_id/cancel=${wrong_url_id}



Delete robot By Id Fail Without Login
   [Documentation]  接口名:删除虾滑${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin robots By Id Fail 403  robot_id/cancel=${robot_id/cancel}



*** Variables ***
${robot_id/cancel}


*** Keywords ***
Post Admin robots Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin robots   &{kwargs}
   expect status is 403  ${resp}  

Post Admin robots Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin robots   &{kwargs}
   expect status is 201  ${resp}  admin_robot/Post_Admin_robots_201.json
   ${robot_id/cancel}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][robot_id/cancel]}
   set global variable   ${robot_id/cancel}

Post Admin robots Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin robots   &{kwargs}
   expect status is 422  ${resp}  

Get Admin robots Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin robots   &{kwargs}
   expect status is 403  ${resp}  

Get Admin robots Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin robots   &{kwargs}
   expect status is 200  ${resp}  admin_robot/Get_Admin_robots_200.json
   ${robot_id/cancel}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][robot_id/cancel]}
   set global variable   ${robot_id/cancel}

Get Admin robots Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin robots   &{kwargs}
   expect status is 422  ${resp}  

Delete Admin robots By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete cancel by robot id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin robots By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete cancel by robot id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin robots By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete cancel by robot id  &{kwargs}
   expect status is 403  ${resp}  

