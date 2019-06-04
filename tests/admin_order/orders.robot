*** Settings ***
Documentation  admin_order
Resource  ../resources.robot
Library  robot_car_wash_server_library.order.OrderLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_order  虾洗后台


*** Test Cases ***
post admin practice orders Success 
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  wash_area_id=${wash_area_id}  car_id=${car_id}  mobile=${mobile}  name=${name}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin practice orders success 201   ${essential_params}  ${unessential_params}

post admin practice orders Fail With Wrong Params
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  wash_area_id=${wash_area_id_422}  car_id=${car_id_422}  mobile=${mobile_422}  name=${name_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin practice orders fail 422   ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
post admin practice orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin practice orders  &{kwargs}
   expect status is 201  ${resp}  admin_order/post_admin_practice_orders_201.json

post admin practice orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin practice orders  &{kwargs}
   expect status is 422  ${resp}  

