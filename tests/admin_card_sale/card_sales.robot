*** Settings ***
Documentation  admin_card_sale
Resource  ../resources.robot
Library  robot_car_wash_server_library.card_sale.CardSaleLibrary
Suite Setup  Login  ${admin_username}   ${admin_password}
Suite Teardown  Logout
Force Tags  model:admin_card_sale  虾洗后台


*** Test Cases ***
post admin card sales Fail With Wrong Params
   [Documentation]  接口名:创建可购买会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_id=${card_id_422}  enabled=ThisIsRobot!  order_by=${order_by_422}  
   ${unessential_params}  create list  
   run every case by params  post admin card sales Fail 422  ${essential_params}  ${unessential_params}  success=False

post admin card sales Success 
   [Documentation]  接口名:创建可购买会员卡${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  post admin card sales Success 201  ${essential_params}  ${unessential_params}

get admin card sales Success 
   [Documentation]  接口名:查询可购买会员卡${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CardSale 列表。
   [Tags]           Respcode:200
    get admin card sales Success 200

put admin card sales by card sale id Success 
   [Documentation]  接口名:修改可购买会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  put admin card sales by card sale id Success 204  ${essential_params}  ${unessential_params}    card_sale_id=${card_sale_id}

put admin card sales by card sale id Fail With Wrong Params
   [Documentation]  接口名:修改可购买会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  card_id=${card_id_422}  enabled=ThisIsRobot!  order_by=${order_by_422}  
   ${unessential_params}  create list  
   run every case by params  put admin card sales by card sale id Fail 422  ${essential_params}  ${unessential_params}    card_sale_id=${card_sale_id}  success=False

put admin card sales by card sale id Fail With Wrong Url
   [Documentation]  接口名:修改可购买会员卡${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   ${essential_params}  create list  card_id=${card_id}  enabled=False  order_by=${order_by}  
   ${unessential_params}  create list  
   run every case by params  put admin card sales by card sale id Fail 404  ${essential_params}  ${unessential_params}    card_sale_id=${w}

delete admin card sales by card sale id Fail With Wrong Url
   [Documentation]  接口名:删除可购买会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin card sales by card sale id Fail 404    card_sale_id=${w}

delete admin card sales by card sale id Success 
   [Documentation]  接口名:删除可购买会员卡${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin card sales by card sale id Success 204    card_sale_id=${card_sale_id}


*** Variables ***
${card_sale_id}  


*** Keywords ***
post admin card sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin card sales  &{kwargs}
   expect status is 422  ${resp}  

post admin card sales Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin card sales  &{kwargs}
   expect status is 201  ${resp}  admin_card_sale/post_admin_card_sales_201.json
   ${card_sale_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_sale_id]}
   set global variable   ${card_sale_id}

get admin card sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin card sales  &{kwargs}
   expect status is 200  ${resp}  admin_card_sale/get_admin_card_sales_200.json
   ${card_sale_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_sale_id]}
   set global variable   ${card_sale_id}

put admin card sales by card sale id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin card sales by card sale id  &{kwargs}
   expect status is 204  ${resp}  

put admin card sales by card sale id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin card sales by card sale id  &{kwargs}
   expect status is 422  ${resp}  

put admin card sales by card sale id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin card sales by card sale id  &{kwargs}
   expect status is 404  ${resp}  

delete admin card sales by card sale id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card sales by card sale id  &{kwargs}
   expect status is 404  ${resp}  

delete admin card sales by card sale id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin card sales by card sale id  &{kwargs}
   expect status is 204  ${resp}  

