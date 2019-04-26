*** Settings ***
Documentation  admin_car_washer
Resource  ../resources.robot
Library  robot_car_wash_server_library.car_washer.CarWasherLibrary
Force Tags  model:admin_car_washer  虾洗后台


*** Test Cases ***
Get order Count by username Fail Without Login
   [Documentation]  接口名:虾客接单数量${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  section=${section}  
   run every case by params  Get order Count by username Fail 403  ${essential_params}  ${unessential_params}  username/order_count=${username/order_count}


*** Variables ***
${username/order_count}  12345678909876543


*** Keywords ***
Get order Count by username Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get order Count by username   &{kwargs}
   expect status is 403  ${resp}  

