*** Settings ***
Documentation  wxmp_card_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_order.CardOrderLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_card_order  车主微信端


*** Test Cases ***
Post Card Orders Success 
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  card_id=${card_id}  
   ${unessential_params}  create list  
   run every case by params  Post Card Orders Success 201  ${essential_params}  ${unessential_params}

Post Card Orders Fail With Wrong Params
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_id=${card_id}  
   ${unessential_params}  create list  
   run every case by params  Post Card Orders Fail 422  ${essential_params}  ${unessential_params}

Post Pay By Card Order Id Fail With Wrong Url
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Card Order Id Fail 404  ${essential_params}  ${unessential_params}  card_order_id/pay=${wrong_url_id}

Post Pay By Card Order Id Success 
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Card Order Id Success 200  ${essential_params}  ${unessential_params}  card_order_id/pay=${card_order_id/pay}

Post Pay By Card Order Id Fail With Wrong Params
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post Pay By Card Order Id Fail 422  ${essential_params}  ${unessential_params}  card_order_id/pay=${card_order_id/pay}


*** Variables ***
${card_order_id/pay}


*** Keywords ***
Post Card Orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Card Orders   &{kwargs}
   expect status is 201  ${resp}  wxmp_card_order/Post_Card_Orders_201.json
   ${card_order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_order_id/pay]}
   set global variable   ${card_order_id/pay}

Post Card Orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Card Orders   &{kwargs}
   expect status is 422  ${resp}  

Post Pay By Card Order Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Card Order Id   &{kwargs}
   expect status is 404  ${resp}  

Post Pay By Card Order Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Card Order Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_card_order/Post_Pay_By_Card_Order_Id_200.json
   ${card_order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_order_id/pay]}
   set global variable   ${card_order_id/pay}

Post Pay By Card Order Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Pay By Card Order Id   &{kwargs}
   expect status is 422  ${resp}  

