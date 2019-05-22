*** Settings ***
Documentation  wxmp_card_sale
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_sale.CardSaleLibrary
Suite Setup  Login By Openid  ${openid}
Force Tags  model:wxmp_card_sale  车主微信端


*** Test Cases ***
get card sales Success 
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 CardSale 列表。
   [Tags]           Respcode:200
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get card sales Success 200  ${essential_params}  ${unessential_params}

get card sales Fail With Wrong Params
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=ThisIsRobot!  page_num=${page_num_422}  page_size=${page_size_422}  
   run every case by params  get card sales Fail 422  ${essential_params}  ${unessential_params}  success=False


*** Keywords ***
get card sales Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get card sales  &{kwargs}
   expect status is 200  ${resp}  wxmp_card_sale/get_card_sales_200.json

get card sales Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get card sales  &{kwargs}
   expect status is 422  ${resp}  

