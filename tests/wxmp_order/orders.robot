*** Settings ***
Documentation  wxmp_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.order.OrderLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_order  车主微信端


*** Test Cases ***
Post Order Service Group Success 
   [Documentation]  接口名:更换套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  service_group_id=${service_group_id}  old_order_id=${old_order_id}  
   ${unessential_params}  create list  coupon_id=${coupon_id}  car_type=${car_type}  
   run every case by params  Post Order Service Group Success 201  ${essential_params}  ${unessential_params}

Post Order Service Group Fail With Wrong Params
   [Documentation]  接口名:更换套餐${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_group_id=${service_group_id_422}  old_order_id=${old_order_id_422}  
   ${unessential_params}  create list  coupon_id=${coupon_id_422}  car_type=${car_type_422}  
   run every case by params  Post Order Service Group Fail 422  ${essential_params}  ${unessential_params}

Post Orders Success 
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  service_group_id=${service_group_id}  mobile=${mobile}  name=${name}  order_type=${order_type}  user_car_id=${user_car_id}  user_contact_id=${user_contact_id}  
   ${unessential_params}  create list  wash_group_id=${wash_group_id}  wash_normal_id=${wash_normal_id}  parking_id=${parking_id}  wxmp_remark=${wxmp_remark}  coupon_id=${coupon_id}  car_id=${car_id}  car_type=${car_type}  car_place=${car_place}  card_id=${card_id}  
   run every case by params  Post Orders Success 201  ${essential_params}  ${unessential_params}

Post Orders Fail With Wrong Params
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  service_group_id=${service_group_id_422}  mobile=${mobile_422}  name=${name_422}  order_type=${order_type_422}  user_car_id=${user_car_id_422}  user_contact_id=${user_contact_id_422}  
   ${unessential_params}  create list  wash_group_id=${wash_group_id_422}  wash_normal_id=${wash_normal_id_422}  parking_id=${parking_id_422}  wxmp_remark=${wxmp_remark_422}  coupon_id=${coupon_id_422}  car_id=${car_id_422}  car_type=${car_type_422}  car_place=${car_place_422}  card_id=${card_id_422}  
   run every case by params  Post Orders Fail 422  ${essential_params}  ${unessential_params}

Post Pay By Order Id Fail With Wrong Url
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  pay_type=${pay_type}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Order Id Fail 404  ${essential_params}  ${unessential_params}  order_id/pay=${wrong_url_id}

Post Pay By Order Id Success 
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  pay_type=${pay_type}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Order Id Success 200  ${essential_params}  ${unessential_params}  order_id/pay=${order_id/pay}

Post Pay By Order Id Fail With Wrong Params
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  pay_type=${pay_type_422}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Order Id Fail 422  ${essential_params}  ${unessential_params}  order_id/pay=${order_id/pay}

Get Price Range Success 
   [Documentation]  接口名:查价格区间${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal_id=${wash_normal_id}  wash_group_id=${wash_group_id}  wash_able_group_id=${wash_able_group_id}  
   run every case by params  Get Price Range Success 200  ${essential_params}  ${unessential_params}

Get Price Range Fail With Wrong Params
   [Documentation]  接口名:查价格区间${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  wash_normal_id=${wash_normal_id_422}  wash_group_id=${wash_group_id_422}  wash_able_group_id=${wash_able_group_id_422}  
   run every case by params  Get Price Range Fail 422  ${essential_params}  ${unessential_params}

Get Orders By Order Id Fail With Wrong Url
   [Documentation]  接口名:获取订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Orders By Order Id Fail 404  order_id=${wrong_url_id}

Get Orders By Order Id Success 
   [Documentation]  接口名:获取订单${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Order 对象。
   [Tags]           Respcode:200
   Get Orders By Order Id Success 200  order_id=${order_id}


*** Variables ***
${order_id/pay}  
${order_id}  


*** Keywords ***
Post Order Service Group Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Order Service Group   &{kwargs}
   expect status is 201  ${resp}  wxmp_order/Post_Order_Service_Group_201.json
   ${order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id/pay]}
   set global variable   ${order_id/pay}
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id]}
   set global variable   ${order_id}

Post Order Service Group Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Order Service Group   &{kwargs}
   expect status is 422  ${resp}  

Post Orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Orders   &{kwargs}
   expect status is 201  ${resp}  wxmp_order/Post_Orders_201.json
   ${order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id/pay]}
   set global variable   ${order_id/pay}
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id]}
   set global variable   ${order_id}

Post Orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Orders   &{kwargs}
   expect status is 422  ${resp}  

Post Pay By Order Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Order Id   &{kwargs}
   expect status is 404  ${resp}  

Post Pay By Order Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Order Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_order/Post_Pay_By_Order_Id_200.json
   ${order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id/pay]}
   set global variable   ${order_id/pay}
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id]}
   set global variable   ${order_id}

Post Pay By Order Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Order Id   &{kwargs}
   expect status is 422  ${resp}  

Get Price Range Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Price Range   &{kwargs}
   expect status is 200  ${resp}  wxmp_order/Get_Price_Range_200.json
   ${order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id/pay]}
   set global variable   ${order_id/pay}
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id]}
   set global variable   ${order_id}

Get Price Range Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Price Range   &{kwargs}
   expect status is 422  ${resp}  

Get Orders By Order Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Orders By Order Id   &{kwargs}
   expect status is 404  ${resp}  

Get Orders By Order Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Orders By Order Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_order/Get_Orders_By_Order_Id_200.json
   ${order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id/pay]}
   set global variable   ${order_id/pay}
   ${order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][order_id]}
   set global variable   ${order_id}

