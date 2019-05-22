*** Settings ***
Documentation  admin_order
Resource  ../resources.robot
Library  robot_car_wash_server_library.order.OrderLibrary
Force Tags  model:admin_order  虾洗后台


*** Test Cases ***
post admin practice orders Fail Without Login
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_area_id=${wash_area_id}  car_id=${car_id}  mobile=${mobile}  name=${name}  
   ${unessential_params}  create list  
   run every case by params  post admin practice orders Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
post admin practice orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin practice orders  &{kwargs}
   expect status is 403  ${resp}  
