*** Settings ***
Documentation  admin_card
Resource  ../resources.robot
Library  robot_car_wash_server_library.card.CardLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_card  虾洗后台


*** Test Cases ***
Post card Success 
   [Documentation]  接口名:创建会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  card_name=${card_name}  days=${days}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  
   ${unessential_params}  create list  grant_way=${grant_way}  auto_recharge=False  coupons=${coupons}  card_remark=${card_remark}  
   run every case by params  Post admin cards Success 201  ${essential_params}  ${unessential_params}



Post card Fail With Wrong Params
   [Documentation]  接口名:创建会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_name=${card_name}  days=${days}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  
   ${unessential_params}  create list  grant_way=${grant_way}  auto_recharge=False  coupons=${coupons}  card_remark=${card_remark}  
   run every case by params  Post admin cards Fail 422  ${essential_params}  ${unessential_params}



Post card Fail Without Login
   [Documentation]  接口名:创建会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  card_name=${card_name}  days=${days}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  
   ${unessential_params}  create list  grant_way=${grant_way}  auto_recharge=False  coupons=${coupons}  card_remark=${card_remark}  
   run every case by params  Post admin cards Fail 403  ${essential_params}  ${unessential_params}



Get card Success 
   [Documentation]  接口名:查询会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 Card 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  card_id=${card_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin cards Success 200  ${essential_params}  ${unessential_params}



Get card Fail Without Login
   [Documentation]  接口名:查询会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  card_id=${card_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin cards Fail 403  ${essential_params}  ${unessential_params}



Get card Fail With Wrong Params
   [Documentation]  接口名:查询会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  card_id=${card_id}  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get admin cards Fail 422  ${essential_params}  ${unessential_params}



Put card By Id Success 
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  
   ${unessential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  auto_recharge=False  coupons=${coupons}  card_remark=${card_remark}  
   run every case by params  Put admin cards By Id Success 204  ${essential_params}  ${unessential_params}  card_id=${card_id}



Put card By Id Fail Without Login
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  auto_recharge=False  coupons=${coupons}  card_remark=${card_remark}  
   run every case by params  Put admin cards By Id Fail 403  ${essential_params}  ${unessential_params}  card_id=${card_id}



Put card By Id Fail With Wrong Params
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  auto_recharge=False  coupons=${coupons}  card_remark=${card_remark}  
   run every case by params  Put admin cards By Id Fail 422  ${essential_params}  ${unessential_params}  card_id=${card_id}



Put card By Id Fail With Wrong Url
   [Documentation]  接口名:修改会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  
   ${unessential_params}  create list  card_name=${card_name}  days=${days}  grant_way=${grant_way}  price=${price}  first_price=${first_price}  recharge_price=${recharge_price}  first_recharge_price=${first_recharge_price}  auto_recharge=False  coupons=${coupons}  card_remark=${card_remark}  
   run every case by params  Put admin cards By Id Fail 404  ${essential_params}  ${unessential_params}  card_id=${wrong_url_id}



Delete card By Id Success 
   [Documentation]  接口名:删除会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete admin cards By Id Success 204  card_id=${card_id}



Delete card By Id Fail With Wrong Url
   [Documentation]  接口名:删除会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete admin cards By Id Fail 404  card_id=${wrong_url_id}



Delete card By Id Fail Without Login
   [Documentation]  接口名:删除会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Delete admin cards By Id Fail 403  card_id=${card_id}



*** Variables ***
${card_id}


*** Keywords ***
Post Admin cards Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin cards   &{kwargs}
   expect status is 201  ${resp}  admin_card/Post_Admin_cards_201.json
   ${card_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_id]}
   set global variable   ${card_id}

Post Admin cards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin cards   &{kwargs}
   expect status is 422  ${resp}  

Post Admin cards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin cards   &{kwargs}
   expect status is 403  ${resp}  

Get Admin cards Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin cards   &{kwargs}
   expect status is 200  ${resp}  admin_card/Get_Admin_cards_200.json
   ${card_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_id]}
   set global variable   ${card_id}

Get Admin cards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin cards   &{kwargs}
   expect status is 403  ${resp}  

Get Admin cards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin cards   &{kwargs}
   expect status is 422  ${resp}  

Put Admin cards By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 204  ${resp}  

Put Admin cards By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 403  ${resp}  

Put Admin cards By Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 422  ${resp}  

Put Admin cards By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin cards by card id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin cards By Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin cards by card id  &{kwargs}
   expect status is 204  ${resp}  

Delete Admin cards By Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin cards by card id  &{kwargs}
   expect status is 404  ${resp}  

Delete Admin cards By Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin cards by card id  &{kwargs}
   expect status is 403  ${resp}  

