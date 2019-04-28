*** Settings ***
Documentation  admin_robot
Resource  ../resources.robot
Library  robot_car_wash_server_library.robot.RobotLibrary
Force Tags  model:admin_robot  虾洗后台


*** Test Cases ***
post admin robots Fail Without Login
   [Documentation]  接口名:新增虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_id=${car_id}  
   ${unessential_params}  create list  
   run every case by params  post admin robots Fail 403  ${essential_params}  ${unessential_params}

get admin robots Fail Without Login
   [Documentation]  接口名:获取虾滑列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin robots Fail 403  ${essential_params}  ${unessential_params}

delete admin robots cancel by robot id Fail Without Login
   [Documentation]  接口名:删除虾滑${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin robots cancel by robot id Fail 403    robot_id/cancel=${robot_id/cancel}


*** Variables ***
${robot_id/cancel}  12345678909876543


*** Keywords ***
post admin robots Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin robots  &{kwargs}
   expect status is 403  ${resp}  

get admin robots Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin robots  &{kwargs}
   expect status is 403  ${resp}  

delete admin robots cancel by robot id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin robots cancel by robot id  &{kwargs}
   expect status is 403  ${resp}  

