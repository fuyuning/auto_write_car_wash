*** Settings ***
Documentation  admin_card
Resource  ../resources.robot
Library  robot_car_wash_server_library.card.CardLibrary
Force Tags  model:admin_card  虾洗后台


*** Test Cases ***
post admin cards Fail Without Login
   [Documentation]  接口名:创建会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  card_remark=${card_remark}  
   ${unessential_params}  create list  auto_recharge=False  coupons=${coupons}  
   run every case by params  post admin cards Fail 403  ${essential_params}  ${unessential_params}

get admin cards Fail Without Login
   [Documentation]  接口名:查询会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  card_id=${card_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get admin cards Fail 403  ${essential_params}  ${unessential_params}

put admin cards by card id Fail Without Login
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  card_remark=${card_remark}  
   ${unessential_params}  create list  auto_recharge=False  coupons=${coupons}  
   run every case by params  put admin cards by card id Fail 403  ${essential_params}  ${unessential_params}    card_id=${card_id}

delete admin cards by card id Fail Without Login
   [Documentation]  接口名:删除会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin cards by card id Fail 403    card_id=${card_id}


*** Variables ***
${card_id}  12345678909876543


*** Keywords ***
post admin cards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin cards  &{kwargs}
   expect status is 403  ${resp}  

get admin cards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin cards  &{kwargs}
   expect status is 403  ${resp}  

put admin cards by card id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 403  ${resp}  

delete admin cards by card id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin cards by card id  &{kwargs}
   expect status is 403  ${resp}  

