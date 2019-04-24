*** Settings ***
Documentation  wxmp_card
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.card.CardLibrary
Suite Setup  Login By Openid  ${openid}

Force Tags  model:wxmp_card  车主微信端


*** Test Cases ***
Get Price By Card Id Success 
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  对象。
   [Tags]           Respcode:200
   Get Price By Card Id Success 200  card_id/price=${card_id/price}

Get Price By Card Id Fail With Wrong Url
   [Documentation]  接口名:可购买的会员卡列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   Get Price By Card Id Fail 404  card_id/price=${wrong_url_id}


*** Variables ***
${card_id/price}


*** Keywords ***
Get Price By Card Id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  Get Price By Card Id   &{kwargs}
   expect status is 200  ${resp}  wxmp_card/Get_Price_By_Card_Id_200.json
   ${card_id/price}  set variable if  ${resp.json()}!=[]  ${resp.json()[0][card_id/price]}
   set global variable   ${card_id/price}

Get Price By Card Id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  Get Price By Card Id   &{kwargs}
   expect status is 404  ${resp}  

