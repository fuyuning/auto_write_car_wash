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
   ${essential_params}  create list  service_group_id=${service_group_id}  old_order_id=${old_order_id}  
   ${unessential_params}  create list  coupon_id=${coupon_id}  car_type=${car_type}  
   run every case by params  post order service group Fail 403  ${essential_params}  ${unessential_params}

post orders Fail Without Login
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  service_group_id=${service_group_id}  mobile=${mobile}  name=${name}  order_type=${order_type}  user_car_id=${user_car_id}  user_contact_id=${user_contact_id}  
   ${unessential_params}  create list  wash_group_id=${wash_group_id}  wash_normal_id=${wash_normal_id}  parking_id=${parking_id}  wxmp_remark=${wxmp_remark}  coupon_id=${coupon_id}  car_id=${car_id}  car_type=${car_type}  car_place=${car_place}  card_id=${card_id}  
   run every case by params  post orders Fail 403  ${essential_params}  ${unessential_params}

post orders pay by order id Fail Without Login
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  pay_type=${pay_type}  
   ${unessential_params}  create list  
   run every case by params  post orders pay by order id Fail 403  ${essential_params}  ${unessential_params}    order_id=${order_id}

get price range Fail Without Login
   [Documentation]  接口名:查价格区间${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal_id=${wash_normal_id}  wash_group_id=${wash_group_id}  wash_able_group_id=${wash_able_group_id}  
   run every case by params  get price range Fail 403  ${essential_params}  ${unessential_params}

get orders by order id Fail Without Login
   [Documentation]  接口名:获取订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get orders by order id Fail 403    order_id=${order_id}


*** Variables ***
${order_id}  12345678909876543


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

get price range Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get price range  &{kwargs}
   expect status is 403  ${resp}  

get orders by order id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get orders by order id  &{kwargs}
   expect status is 403  ${resp}  

