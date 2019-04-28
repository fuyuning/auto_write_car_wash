*** Settings ***
Documentation  wxmp_card_sale
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card_sale.CardSaleLibrary
Force Tags  model:wxmp_card_sale  车主微信端


*** Test Cases ***
get card sales Fail Without Login
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   ${essential_params}  create list  
   ${unessential_params}  create list  enabled=False  page_num=${page_num}  page_size=${page_size}  
   run every case by params  get card sales Fail 403  ${essential_params}  ${unessential_params}


*** Keywords ***
get card sales Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get card sales  &{kwargs}
   expect status is 403  ${resp}  

