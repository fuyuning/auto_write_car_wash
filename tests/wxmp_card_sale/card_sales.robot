*** Settings ***
Documentation  wxmp_card_sale
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_sale.CardSaleLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_card_sale  车主微信端


*** Test Cases ***
Get Card Sales Success 
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CardSale 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Card Sales Success 200  ${essential_params}  ${unessential_params}

Get Card Sales Fail With Wrong Params
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  Get Card Sales Fail 422  ${essential_params}  ${unessential_params}


*** Keywords ***
Get Card Sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Card Sales   &{kwargs}
   expect status is 200  ${resp}  wxmp_card_sale/Get_Card_Sales_200.json

Get Card Sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  Get Card Sales   &{kwargs}
   expect status is 422  ${resp}  

