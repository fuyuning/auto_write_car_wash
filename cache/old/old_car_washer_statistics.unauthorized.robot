*** Settings ***
Documentation  admin_car_washer_statistic
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer_statistic.CarWasherStatisticLibrary
Force Tags  model:admin_car_washer_statistic  虾洗后台


*** Test Cases ***
get admin car washer statistics Fail Without Login
   [Documentation]  接口名:统计列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  username=${username}  mobile=${mobile}  section=${section}  order_by=${order_by}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin car washer statistics Fail 403  ${essential_params}  ${unessential_params}

patch admin car washer statistics visible by username Fail Without Login
   [Documentation]  接口名:统计数据隐藏${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  visible=False  
   ${unessential_params}  create list  
   run every case by params  patch admin car washer statistics visible by username Fail 403  ${essential_params}  ${unessential_params}    username=${username}


*** Variables ***
${username}  12345678909876543


*** Keywords ***
get admin car washer statistics Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin car washer statistics  &{kwargs}
   expect status is 403  ${resp}  

patch admin car washer statistics visible by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin car washer statistics visible by username  &{kwargs}
   expect status is 403  ${resp}  

