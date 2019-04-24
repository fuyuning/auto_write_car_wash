*** Settings ***
Documentation  wxmp_card_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_order.CardOrderLibrary
Force Tags  model:wxmp_card_order  车主微信端


*** Test Cases ***
Post Card Orders Fail Without Login
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_id=${card_id}  
   ${unessential_params}  create list  
   run every case by params  Post Card Orders Fail 403  ${essential_params}  ${unessential_params}

Post Pay By Card Order Id Fail Without Login
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Card Order Id Fail 403  ${essential_params}  ${unessential_params}  card_order_id/pay=${card_order_id/pay}


*** Variables ***
${card_order_id/pay}


*** Keywords ***
Post Card Orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Card Orders   &{kwargs}
   expect status is 403  ${resp}  

Post Pay By Card Order Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Card Order Id   &{kwargs}
   expect status is 403  ${resp}  

