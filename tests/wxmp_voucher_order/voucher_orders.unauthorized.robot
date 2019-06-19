*** Settings ***
Documentation  wxmp_voucher_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.voucher_order.VoucherOrderLibrary
Force Tags  model:wxmp_voucher_order  车主微信端


*** Test Cases ***
post voucher orders Fail Without Login
   [Documentation]  接口名:创建洗车券订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post voucher orders fail 403   voucher_info=${voucher_info}    

post voucher orders pay by voucher order id Fail Without Login
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post voucher orders pay by voucher order id fail 403     voucher_order_id=${voucher_order_id}  pay_type=${pay_type}  openid=${openid}    


*** Variables ***
${voucher_order_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post voucher orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post voucher orders  &{kwargs}
   expect status is 403  ${resp}  

post voucher orders pay by voucher order id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post voucher orders pay by voucher order id  &{kwargs}
   expect status is 403  ${resp}  

