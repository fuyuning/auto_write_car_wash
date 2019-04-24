*** Settings ***
Documentation  wxmp_card
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card.CardLibrary
Force Tags  model:wxmp_card  车主微信端


*** Test Cases ***
Get Price By Card Id Fail Without Login
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   Get Price By Card Id Fail 403  card_id/price=${card_id/price}


*** Variables ***
${card_id/price}  12345678909876543


*** Keywords ***
Get Price By Card Id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  Get Price By Card Id   &{kwargs}
   expect status is 403  ${resp}  

