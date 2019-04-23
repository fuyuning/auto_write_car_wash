*** Settings ***
Documentation  admin_order
Resource  ../resources.robot
Library  robot_car_wash_server_library.order.OrderLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_order  虾洗后台


*** Test Cases ***
Post order Fail Without Login
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  wash_area_id=${wash_area_id}  car_id=${car_id}  mobile=${mobile}  name=${name}  
   ${unessential_params}  create list  
   run every case by params  Post practice orders Fail 403  ${essential_params}  ${unessential_params}



Post order Success 
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_area_id=${wash_area_id}  car_id=${car_id}  mobile=${mobile}  name=${name}  
   ${unessential_params}  create list  
   run every case by params  Post practice orders Success 201  ${essential_params}  ${unessential_params}



Post order Fail With Wrong Params
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_area_id=${wash_area_id}  car_id=${car_id}  mobile=${mobile}  name=${name}  
   ${unessential_params}  create list  
   run every case by params  Post practice orders Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Post Practice orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post practice orders   &{kwargs}
   expect status is 403  ${resp}  

Post Practice orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post practice orders   &{kwargs}
   expect status is 201  ${resp}  admin_order/Post_Practice_orders_201.json

Post Practice orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post practice orders   &{kwargs}
   expect status is 422  ${resp}  

