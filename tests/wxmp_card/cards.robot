*** Settings ***
Documentation  wxmp_card
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card.CardLibrary
Suite Setup  login by unionid   ${unionid}
Force Tags  model:wxmp_card  车主微信端


*** Test Cases ***
get cards price by card id Fail With Wrong Url
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get cards price by card id fail 404     card_id=${wrong_url_id}

get cards price by card id Success 
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   get cards price by card id success 200     card_id=${card_id}

get coupon pools coupon pool id Success 
   [Documentation]  接口名:首页会员购买价格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  card_id=${card_id}  
   ${unessential_params}  create dictionary  
   run every case by params   get coupon pools coupon pool id success 201   ${essential_params}  ${unessential_params}

get coupon pools coupon pool id Fail With Wrong Params
   [Documentation]  接口名:首页会员购买价格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  card_id=${card_id_422}  
   ${unessential_params}  create dictionary  
   run every case by params   get coupon pools coupon pool id fail 422   ${essential_params}  ${unessential_params}  success=False


*** Variables ***
${card_id}  


*** Keywords ***
get cards price by card id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get cards price by card id  &{kwargs}
   expect status is 404  ${resp}  

get cards price by card id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get cards price by card id  &{kwargs}
   expect status is 200  ${resp}  wxmp_card/get_cards_price_by_card_id_200.json
   ${card_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['card_id']}
   set global variable   ${card_id}

get coupon pools coupon pool id Success 201
   [Arguments]  &{kwargs}
   ${resp}=  get coupon pools coupon pool id  &{kwargs}
   expect status is 201  ${resp}  wxmp_card/get_coupon_pools_coupon_pool_id_201.json
   ${card_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['card_id']}
   set global variable   ${card_id}

get coupon pools coupon pool id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get coupon pools coupon pool id  &{kwargs}
   expect status is 422  ${resp}  

