*** Settings ***
Documentation  admin_card
Resource  ../resources.robot
Library  robot_car_wash_server_library.card.CardLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_card  虾洗后台


*** Test Cases ***
post admin cards Fail With Wrong Params
   [Documentation]  接口名:创建会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_name=${card_name_422}  days=${days_422}  grant_way=${grant_way_422}  price=${price_422}  first_price=${first_price_422}  recharge_price=${recharge_price_422}  first_recharge_price=${first_recharge_price_422}  card_remark=${card_remark_422}  
   ${unessential_params}  create list  auto_recharge=ThisIsRobot!  coupons=${coupons_422}  
   run every case by params  post admin cards Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin cards Success 
   [Documentation]  接口名:创建会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  card_remark=${card_remark}  
   ${unessential_params}  create list  auto_recharge=False  coupons=${coupons}  
   run every case by params  post admin cards Success 201  ${essential_params}  ${unessential_params}

get admin cards Success 
   [Documentation]  接口名:查询会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Card 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  card_id=${card_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin cards Success 200  ${essential_params}  ${unessential_params}

get admin cards Fail With Wrong Params
   [Documentation]  接口名:查询会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  card_id=${card_id_422}  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get admin cards Fail 422  ${essential_params}  ${unessential_params}  success=False

put admin cards by card id Success 
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  card_remark=${card_remark}  
   ${unessential_params}  create list  auto_recharge=False  coupons=${coupons}  
   run every case by params  put admin cards by card id Success 204  ${essential_params}  ${unessential_params}    card_id=${card_id}

put admin cards by card id Fail With Wrong Params
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_name=${card_name_422}  days=${days_422}  grant_way=${grant_way_422}  price=${price_422}  first_price=${first_price_422}  recharge_price=${recharge_price_422}  first_recharge_price=${first_recharge_price_422}  card_remark=${card_remark_422}  
   ${unessential_params}  create list  auto_recharge=ThisIsRobot!  coupons=${coupons_422}  
   run every case by params  put admin cards by card id Fail 422  ${essential_params}  ${unessential_params}    card_id=${card_id}  success=False

put admin cards by card id Fail With Wrong Url
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  card_remark=${card_remark}  
   ${unessential_params}  create list  auto_recharge=False  coupons=${coupons}  
   run every case by params  put admin cards by card id Fail 404  ${essential_params}  ${unessential_params}    card_id=${w}

delete admin cards by card id Fail With Wrong Url
   [Documentation]  接口名:删除会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin cards by card id Fail 404    card_id=${w}

delete admin cards by card id Success 
   [Documentation]  接口名:删除会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin cards by card id Success 204    card_id=${card_id}


*** Variables ***
${card_id}  


*** Keywords ***
post admin cards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin cards  &{kwargs}
   expect status is 422  ${resp}  

post admin cards Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin cards  &{kwargs}
   expect status is 201  ${resp}  admin_card/post_admin_cards_201.json
   ${card_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_id]}
   set global variable   ${card_id}

get admin cards Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin cards  &{kwargs}
   expect status is 200  ${resp}  admin_card/get_admin_cards_200.json
   ${card_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_id]}
   set global variable   ${card_id}

get admin cards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin cards  &{kwargs}
   expect status is 422  ${resp}  

put admin cards by card id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 204  ${resp}  

put admin cards by card id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 422  ${resp}  

put admin cards by card id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 404  ${resp}  

delete admin cards by card id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin cards by card id  &{kwargs}
   expect status is 404  ${resp}  

delete admin cards by card id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin cards by card id  &{kwargs}
   expect status is 204  ${resp}  

