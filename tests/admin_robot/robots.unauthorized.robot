*** Settings ***
Documentation  admin_robot
Resource  ../resources.robot
Library  robot_car_wash_server_library.robot.RobotLibrary
Force Tags  model:admin_robot  虾洗后台


*** Test Cases ***
Post Admin Robots Fail Without Login
   [Documentation]  接口名:新增虾滑${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  mobile=${mobile}  name=${name}  car_id=${car_id}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Robots Fail 403  ${essential_params}  ${unessential_params}

Get Admin Robots Fail Without Login
   [Documentation]  接口名:获取虾滑列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  mobile=${mobile}  car_id=${car_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Robots Fail 403  ${essential_params}  ${unessential_params}

Delete Cancel By Robot Id Fail Without Login
   [Documentation]  接口名:删除虾滑${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Cancel By Robot Id Fail 403  robot_id/cancel=${robot_id/cancel}


*** Variables ***
${robot_id/cancel}  12345678909876543


*** Keywords ***
Post Admin Robots Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Robots   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Robots Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Robots   &{kwargs}
   expect status is 403  ${resp}  

Delete Cancel By Robot Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Cancel By Robot Id   &{kwargs}
   expect status is 403  ${resp}  

