*** Settings ***
Documentation  wxmp_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.order.OrderLibrary
Force Tags  model:wxmp_order  车主微信端


*** Test Cases ***
Post Order Service Group Fail Without Login
   [Documentation]  接口名:更换套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_id=${service_group_id}  old_order_id=${old_order_id}  
   ${unessential_params}  create list  coupon_id=${coupon_id}  car_type=${car_type}  
   run every case by params  Post Order Service Group Fail 403  ${essential_params}  ${unessential_params}

Post Orders Fail Without Login
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_id=${service_group_id}  mobile=${mobile}  name=${name}  order_type=${order_type}  user_car_id=${user_car_id}  user_contact_id=${user_contact_id}  
   ${unessential_params}  create list  wash_group_id=${wash_group_id}  wash_normal_id=${wash_normal_id}  parking_id=${parking_id}  wxmp_remark=${wxmp_remark}  coupon_id=${coupon_id}  car_id=${car_id}  car_type=${car_type}  car_place=${car_place}  card_id=${card_id}  
   run every case by params  Post Orders Fail 403  ${essential_params}  ${unessential_params}

Post Pay By Order Id Fail Without Login
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  pay_type=${pay_type}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Order Id Fail 403  ${essential_params}  ${unessential_params}  order_id/pay=${order_id/pay}

Get Price Range Fail Without Login
   [Documentation]  接口名:查价格区间${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal_id=${wash_normal_id}  wash_group_id=${wash_group_id}  wash_able_group_id=${wash_able_group_id}  
   run every case by params  Get Price Range Fail 403  ${essential_params}  ${unessential_params}

Get Orders By Order Id Fail Without Login
   [Documentation]  接口名:获取订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Orders By Order Id Fail 403  order_id=${order_id}


*** Variables ***
${order_id/pay}
${order_id}


*** Keywords ***
Post Order Service Group Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Order Service Group   &{kwargs}
   expect status is 403  ${resp}  

Post Orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Orders   &{kwargs}
   expect status is 403  ${resp}  

Post Pay By Order Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Order Id   &{kwargs}
   expect status is 403  ${resp}  

Get Price Range Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Price Range   &{kwargs}
   expect status is 403  ${resp}  

Get Orders By Order Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Orders By Order Id   &{kwargs}
   expect status is 403  ${resp}  

