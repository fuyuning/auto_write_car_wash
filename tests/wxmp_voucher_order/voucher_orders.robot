*** Settings ***
Documentation  wxmp_voucher_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher_order.VoucherOrderLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_voucher_order  车主微信端


*** Test Cases ***
post voucher orders Success 
   [Documentation]  接口名:创建洗车券订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  voucher_info=${voucher_info}  
   ${unessential_params}  create dictionary  
   run every case by params   post voucher orders success 201   ${essential_params}  ${unessential_params}

post voucher orders Fail With Wrong Params
   [Documentation]  接口名:创建洗车券订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  voucher_info=${voucher_info_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post voucher orders fail 422   ${essential_params}  ${unessential_params}  success=False

post voucher orders pay by voucher order id Fail With Wrong Url
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   post voucher orders pay by voucher order id fail 404     voucher_order_id=${wrong_url_id}  pay_type=${pay_type}  openid=${openid}    

post voucher orders pay by voucher order id Success 
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create dictionary  
   run every case by params   post voucher orders pay by voucher order id success 200   ${essential_params}  ${unessential_params}    voucher_order_id=${voucher_order_id}

post voucher orders pay by voucher order id Fail With Wrong Params
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  pay_type=${pay_type_422}  openid=${openid_422}  
   ${unessential_params}  create dictionary  
   run every case by params   post voucher orders pay by voucher order id fail 422   ${essential_params}  ${unessential_params}    voucher_order_id=${voucher_order_id}  success=False


*** Variables ***
${voucher_order_id}  


*** Keywords ***
post voucher orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post voucher orders  &{kwargs}
   expect status is 201  ${resp}  wxmp_voucher_order/post_voucher_orders_201.json
   ${voucher_order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['voucher_order_id']}
   set global variable   ${voucher_order_id}

post voucher orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post voucher orders  &{kwargs}
   expect status is 422  ${resp}  

post voucher orders pay by voucher order id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post voucher orders pay by voucher order id  &{kwargs}
   expect status is 404  ${resp}  

post voucher orders pay by voucher order id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post voucher orders pay by voucher order id  &{kwargs}
   expect status is 200  ${resp}  wxmp_voucher_order/post_voucher_orders_pay_by_voucher_order_id_200.json
   ${voucher_order_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['voucher_order_id']}
   set global variable   ${voucher_order_id}

post voucher orders pay by voucher order id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post voucher orders pay by voucher order id  &{kwargs}
   expect status is 422  ${resp}  

