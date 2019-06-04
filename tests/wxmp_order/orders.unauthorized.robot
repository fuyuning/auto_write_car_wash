*** Settings ***
Documentation  wxmp_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.order.OrderLibrary
Force Tags  model:wxmp_order  车主微信端


*** Test Cases ***
post order service group Fail Without Login
   [Documentation]  接口名:更换套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post order service group fail 403   service_group_id=${service_group_id}  old_order_id=${old_order_id}    coupon_id=${coupon_id}  car_type=${car_type}  

post orders Fail Without Login
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post orders fail 403   service_group_id=${service_group_id}  mobile=${mobile}  name=${name}  order_type=${order_type}  user_car_id=${user_car_id}  user_contact_id=${user_contact_id}    wash_group_id=${wash_group_id}  wash_normal_id=${wash_normal_id}  parking_id=${parking_id}  wxmp_remark=${wxmp_remark}  coupon_id=${coupon_id}  car_id=${car_id}  car_type=${car_type}  car_place=${car_place}  card_id=${card_id}  position=${position}  lucky_flop_award_id=${lucky_flop_award_id}  

post orders pay by order id Fail Without Login
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post orders pay by order id fail 403     order_id=${order_id}  pay_type=${pay_type}    

get orders by order id Fail Without Login
   [Documentation]  接口名:获取订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get orders by order id fail 403     order_id=${order_id}


*** Variables ***
${order_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post order service group Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post order service group  &{kwargs}
   expect status is 403  ${resp}  

post orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post orders  &{kwargs}
   expect status is 403  ${resp}  

post orders pay by order id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post orders pay by order id  &{kwargs}
   expect status is 403  ${resp}  

get orders by order id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get orders by order id  &{kwargs}
   expect status is 403  ${resp}  

