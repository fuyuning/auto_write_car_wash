*** Settings ***
Documentation  admin_order
Resource  ../resources.robot
Library  robot_car_wash_server_library.order.OrderLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_order  虾洗后台


*** Test Cases ***
Post Practice Orders Success 
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  wash_area_id=${wash_area_id}  car_id=${car_id}  mobile=${mobile}  name=${name}  
   ${unessential_params}  create list  
   run every case by params  Post Practice Orders Success 201  ${essential_params}  ${unessential_params}

Post Practice Orders Fail With Wrong Params
   [Documentation]  接口名:创建练习订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  wash_area_id=${wash_area_id_422}  car_id=${car_id_422}  mobile=${mobile_422}  name=${name_422}  
   ${unessential_params}  create list  
   run every case by params  Post Practice Orders Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Post Practice Orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Practice Orders   &{kwargs}
   expect status is 201  ${resp}  admin_order/Post_Practice_Orders_201.json

Post Practice Orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Practice Orders   &{kwargs}
   expect status is 422  ${resp}  

