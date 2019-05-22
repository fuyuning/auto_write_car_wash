*** Settings ***
Documentation  wxmp_card
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card.CardLibrary
Force Tags  model:wxmp_card  车主微信端


*** Test Cases ***
get cards price by card id Fail Without Login
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get cards price by card id Fail 403    card_id=${card_id}


*** Variables ***
${card_id}  12345678909876543


*** Keywords ***
get cards price by card id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get cards price by card id  &{kwargs}
   expect status is 403  ${resp}  

