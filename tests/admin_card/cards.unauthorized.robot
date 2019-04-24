*** Settings ***
Documentation  admin_card
Resource  ../resources.robot
Library  robot_car_wash_server_library.card.CardLibrary
Force Tags  model:admin_card  虾洗后台


Post Admin Cards Fail Without Login
   [Documentation]  接口名:创建会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  card_remark=${card_remark}  
   ${unessential_params}  create list  auto_recharge=False  coupons=${coupons}  
   run every case by params  Post Admin Cards Fail 403  ${essential_params}  ${unessential_params}

Get Admin Cards Fail Without Login
   [Documentation]  接口名:查询会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  card_id=${card_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Admin Cards Fail 403  ${essential_params}  ${unessential_params}

Put Admin Cards By Card Id Fail Without Login
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  card_remark=${card_remark}  
   ${unessential_params}  create list  auto_recharge=False  coupons=${coupons}  
   run every case by params  Put Admin Cards By Card Id Fail 403  ${essential_params}  ${unessential_params}  card_id=${card_id}

Delete Admin Cards By Card Id Fail Without Login
   [Documentation]  接口名:删除会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete Admin Cards By Card Id Fail 403  card_id=${card_id}

Post Admin Cards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Cards   &{kwargs}
   expect status is 403  ${resp}  

Get Admin Cards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Cards   &{kwargs}
   expect status is 403  ${resp}  

Put Admin Cards By Card Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Cards By Card Id   &{kwargs}
   expect status is 403  ${resp}  

Delete Admin Cards By Card Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Cards By Card Id   &{kwargs}
   expect status is 403  ${resp}  

