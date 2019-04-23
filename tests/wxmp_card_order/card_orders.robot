*** Settings ***
Documentation  wxmp_card_order
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_order.CardOrderLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_card_order  车主微信端


*** Test Cases ***
Post card_order Fail Without Login
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_id=${card_id}  
   ${unessential_params}  create list  
   run every case by params  Post card orders Fail 403  ${essential_params}  ${unessential_params}



Post card_order Success 
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  card_id=${card_id}  
   ${unessential_params}  create list  
   run every case by params  Post card orders Success 201  ${essential_params}  ${unessential_params}



Post card_order Fail With Wrong Params
   [Documentation]  接口名:创建订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_id=${card_id}  
   ${unessential_params}  create list  
   run every case by params  Post card orders Fail 422  ${essential_params}  ${unessential_params}



Post card_order By Id Fail With Wrong Url
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post card orders By Id Fail 404  ${essential_params}  ${unessential_params}  card_order_id/pay=${wrong_url_id}



Post card_order By Id Fail Without Login
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post card orders By Id Fail 403  ${essential_params}  ${unessential_params}  card_order_id/pay=${card_order_id/pay}



Post card_order By Id Success 
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post card orders By Id Success 200  ${essential_params}  ${unessential_params}  card_order_id/pay=${card_order_id/pay}



Post card_order By Id Fail With Wrong Params
   [Documentation]  接口名:支付订单${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  pay_type=${pay_type}  openid=${openid}  
   ${unessential_params}  create list  
   run every case by params  Post card orders By Id Fail 422  ${essential_params}  ${unessential_params}  card_order_id/pay=${card_order_id/pay}



*** Variables ***
${card_order_id/pay}


*** Keywords ***
Post Card orders Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post card orders   &{kwargs}
   expect status is 403  ${resp}  

Post Card orders Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post card orders   &{kwargs}
   expect status is 201  ${resp}  wxmp_card_order/Post_Card_orders_201.json
   ${card_order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_order_id/pay]}
   set global variable   ${card_order_id/pay}

Post Card orders Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post card orders   &{kwargs}
   expect status is 422  ${resp}  

Post Card orders By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  post pay by card order id  &{kwargs}
   expect status is 404  ${resp}  

Post Card orders By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post pay by card order id  &{kwargs}
   expect status is 403  ${resp}  

Post Card orders By Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post pay by card order id  &{kwargs}
   expect status is 200  ${resp}  wxmp_card_order/Post_Card_orders_By_Id_200.json
   ${card_order_id/pay}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_order_id/pay]}
   set global variable   ${card_order_id/pay}

Post Card orders By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post pay by card order id  &{kwargs}
   expect status is 422  ${resp}  

