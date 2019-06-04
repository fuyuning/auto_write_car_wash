*** Settings ***
Documentation  wxmp_lucky_flop
Resource  ../resources.robot
Library  robot_car_wash_wxmp_library.lucky_flop.LuckyFlopLibrary
Force Tags  model:wxmp_lucky_flop  车主微信端


*** Test Cases ***
post user lucky flop Fail Without Login
   [Documentation]  接口名:去翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user lucky flop fail 403     wash_normal_id=${wash_normal_id}  

post user lucky flop award Fail Without Login
   [Documentation]  接口名:上传翻牌金额${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post user lucky flop award fail 403   lucky_flop_award_id=${lucky_flop_award_id}  custom_price=${custom_price}    

get user can lucky flop Fail Without Login
   [Documentation]  接口名:我的翻牌资格${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user can lucky flop fail 403     wash_normal_id=${wash_normal_id}  

get user lucky flop Fail Without Login
   [Documentation]  接口名:获取我的翻牌内容${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get user lucky flop fail 403     wash_normal_id=${wash_normal_id}  


*** Keywords ***
post user lucky flop Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop  &{kwargs}
   expect status is 403  ${resp}  

post user lucky flop award Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post user lucky flop award  &{kwargs}
   expect status is 403  ${resp}  

get user can lucky flop Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user can lucky flop  &{kwargs}
   expect status is 403  ${resp}  

get user lucky flop Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get user lucky flop  &{kwargs}
   expect status is 403  ${resp}  

