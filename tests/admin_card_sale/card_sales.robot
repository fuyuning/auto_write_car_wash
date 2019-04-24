*** Settings ***
Documentation  admin_card_sale
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_sale.CardSaleLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_card_sale  虾洗后台


*** Test Cases ***
Post Admin Card Sales Success 
   [Documentation]  接口名:创建可购买会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Card Sales Success 201  ${essential_params}  ${unessential_params}

Post Admin Card Sales Fail With Wrong Params
   [Documentation]  接口名:创建可购买会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Post Admin Card Sales Fail 422  ${essential_params}  ${unessential_params}

Get Admin Card Sales Success 
   [Documentation]  接口名:查询可购买会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CardSale 列表。
   [Tags]           Respcode:200
    Get Admin Card Sales Success 200

Get Admin Card Sales Fail With Wrong Params
   [Documentation]  接口名:查询可购买会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
    Get Admin Card Sales Fail 422

Put Admin Card Sales By Card Sale Id Success 
   [Documentation]  接口名:修改可购买会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Card Sales By Card Sale Id Success 204  ${essential_params}  ${unessential_params}  card_sale_id=${card_sale_id}

Put Admin Card Sales By Card Sale Id Fail With Wrong Params
   [Documentation]  接口名:修改可购买会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Card Sales By Card Sale Id Fail 422  ${essential_params}  ${unessential_params}  card_sale_id=${card_sale_id}

Put Admin Card Sales By Card Sale Id Fail With Wrong Url
   [Documentation]  接口名:修改可购买会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  Put Admin Card Sales By Card Sale Id Fail 404  ${essential_params}  ${unessential_params}  card_sale_id=${wrong_url_id}

Delete Admin Card Sales By Card Sale Id Success 
   [Documentation]  接口名:删除可购买会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   Delete Admin Card Sales By Card Sale Id Success 204  card_sale_id=${card_sale_id}

Delete Admin Card Sales By Card Sale Id Fail With Wrong Url
   [Documentation]  接口名:删除可购买会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Delete Admin Card Sales By Card Sale Id Fail 404  card_sale_id=${wrong_url_id}


*** Variables ***
${card_sale_id}


*** Keywords ***
Post Admin Card Sales Success 201
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Card Sales   &{kwargs}
   expect status is 201  ${resp}  admin_card_sale/Post_Admin_Card_Sales_201.json
   ${card_sale_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_sale_id]}
   set global variable   ${card_sale_id}

Post Admin Card Sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Post Admin Card Sales   &{kwargs}
   expect status is 422  ${resp}  

Get Admin Card Sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Card Sales   &{kwargs}
   expect status is 200  ${resp}  admin_card_sale/Get_Admin_Card_Sales_200.json
   ${card_sale_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_sale_id]}
   set global variable   ${card_sale_id}

Get Admin Card Sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Admin Card Sales   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Card Sales By Card Sale Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Card Sales By Card Sale Id   &{kwargs}
   expect status is 204  ${resp}  

Put Admin Card Sales By Card Sale Id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Card Sales By Card Sale Id   &{kwargs}
   expect status is 422  ${resp}  

Put Admin Card Sales By Card Sale Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Put Admin Card Sales By Card Sale Id   &{kwargs}
   expect status is 404  ${resp}  

Delete Admin Card Sales By Card Sale Id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Card Sales By Card Sale Id   &{kwargs}
   expect status is 204  ${resp}  

Delete Admin Card Sales By Card Sale Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Delete Admin Card Sales By Card Sale Id   &{kwargs}
   expect status is 404  ${resp}  

