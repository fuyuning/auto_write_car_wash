*** Settings ***
Documentation  wxmp_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.order.OrderLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_order  车主微信端


*** Test Cases ***
post order service group Success 
   [Documentation]  接口名:更换套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  service_group_id=${service_group_id}  old_order_id=${old_order_id}  
   ${unessential_params}  create dictionary  coupon_id=${coupon_id}  car_type=${car_type}  
   run every case by params   post order service group success 201   ${essential_params}  ${unessential_params}

post order service group Fail With Wrong Params
   [Documentation]  接口名:更换套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  service_group_id=${service_group_id_422}  old_order_id=${old_order_id_422}  
   ${unessential_params}  create dictionary  coupon_id=${coupon_id_422}  car_type=${car_type_422}  
   run every case by params   post order service group fail 422   ${essential_params}  ${unessential_params}  success=False

post orders Success 
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  service_group_id=${service_group_id}  mobile=${mobile}  name=${name}  order_type=${order_type}  user_car_id=${user_car_id}  user_contact_id=${user_contact_id}  
   ${unessential_params}  create dictionary  wash_group_id=${wash_group_id}  wash_normal_id=${wash_normal_id}  parking_id=${parking_id}  wxmp_remark=${wxmp_remark}  coupon_id=${coupon_id}  car_id=${car_id}  car_type=${car_type}  car_place=${car_place}  card_id=${card_id}  position=${position}  lucky_flop_award_id=${lucky_flop_award_id}  
   run every case by params   post orders success 201   ${essential_params}  ${unessential_params}

post orders Fail With Wrong Params
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  service_group_id=${service_group_id_422}  mobile=${mobile_422}  name=${name_422}  order_type=${order_type_422}  user_car_id=${user_car_id_422}  user_contact_id=${user_contact_id_422}  
   ${unessential_params}  create dictionary  wash_group_id=${wash_group_id_422}  wash_normal_id=${wash_normal_id_422}  parking_id=${parking_id_422}  wxmp_remark=${wxmp_remark_422}  coupon_id=${coupon_id_422}  car_id=${car_id_422}  car_type=${car_type_422}  car_place=${car_place_422}  card_id=${card_id_422}  position=${position_422}  lucky_flop_award_id=${lucky_flop_award_id_422}  
   run every case by params   post orders fail 422   ${essential_params}  ${unessential_params}  success=False

post orders pay by order id Fail With Wrong Url
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post orders pay by order id fail 404     order_id=${wrong_url_id}  pay_type=${pay_type}    

post orders pay by order id Success 
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  pay_type=${pay_type}  
   ${unessential_params}  create dictionary  
   run every case by params   post orders pay by order id success 200   ${essential_params}  ${unessential_params}    order_id=${order_id}

post orders pay by order id Fail With Wrong Params
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  pay_type=${pay_type_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post orders pay by order id fail 422   ${essential_params}  ${unessential_params}    order_id=${order_id}  success=False

get price range Success 
   [Documentation]  接口名:查价格区间${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id}  wash_group_id=${wash_group_id}  wash_able_group_id=${wash_able_group_id}  
   run every case by params   get price range success 200   ${essential_params}  ${unessential_params}

get price range Fail With Wrong Params
   [Documentation]  接口名:查价格区间${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  wash_normal_id=${wash_normal_id_422}  wash_group_id=${wash_group_id_422}  wash_able_group_id=${wash_able_group_id_422}  
   run every case by params   get price range fail 422   ${essential_params}  ${unessential_params}  success=False

get orders by order id Fail With Wrong Url
   [Documentation]  接口名:获取订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get orders by order id fail 404     order_id=${wrong_url_id}

get orders by order id Success 
   [Documentation]  接口名:获取订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Order 对象。
   [Tags]           Respcode:200
   get orders by order id success 200     order_id=${order_id}


*** Variables ***
${order_id}  


*** Keywords ***
post order service group Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post order service group  &{kwargs}
   expect status is 201  ${resp}  wxmp_order/post_order_service_group_201.json
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['order_id']}
   set global variable   ${order_id}

post order service group Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post order service group  &{kwargs}
   expect status is 422  ${resp}  

post orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post orders  &{kwargs}
   expect status is 201  ${resp}  wxmp_order/post_orders_201.json
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['order_id']}
   set global variable   ${order_id}

post orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post orders  &{kwargs}
   expect status is 422  ${resp}  

post orders pay by order id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post orders pay by order id  &{kwargs}
   expect status is 404  ${resp}  

post orders pay by order id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post orders pay by order id  &{kwargs}
   expect status is 200  ${resp}  wxmp_order/post_orders_pay_by_order_id_200.json
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['order_id']}
   set global variable   ${order_id}

post orders pay by order id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post orders pay by order id  &{kwargs}
   expect status is 422  ${resp}  

get price range Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get price range  &{kwargs}
   expect status is 200  ${resp}  wxmp_order/get_price_range_200.json
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['order_id']}
   set global variable   ${order_id}

get price range Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get price range  &{kwargs}
   expect status is 422  ${resp}  

get orders by order id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get orders by order id  &{kwargs}
   expect status is 404  ${resp}  

get orders by order id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get orders by order id  &{kwargs}
   expect status is 200  ${resp}  wxmp_order/get_orders_by_order_id_200.json
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['order_id']}
   set global variable   ${order_id}

