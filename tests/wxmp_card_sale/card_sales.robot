*** Settings ***
Documentation  wxmp_card_sale
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_sale.CardSaleLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_card_sale  车主微信端


*** Test Cases ***
Get card_sale Fail Without Login
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get card sales Fail 403  ${essential_params}  ${unessential_params}



Get card_sale Success 
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CardSale 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get card sales Success 200  ${essential_params}  ${unessential_params}



Get card_sale Fail With Wrong Params
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get card sales Fail 422  ${essential_params}  ${unessential_params}



*** Variables ***


*** Keywords ***
Get Card sales Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get card sales   &{kwargs}
   expect status is 403  ${resp}  

Get Card sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get card sales   &{kwargs}
   expect status is 200  ${resp}  wxmp_card_sale/Get_Card_sales_200.json

Get Card sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get card sales   &{kwargs}
   expect status is 422  ${resp}  

