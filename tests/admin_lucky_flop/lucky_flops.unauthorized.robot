*** Settings ***
Documentation  admin_lucky_flop
Resource  ../resources.robot
Library  robot_car_wash_server_library.lucky_flop.LuckyFlopLibrary
Force Tags  model:admin_lucky_flop  虾洗后台


*** Test Cases ***
post admin lucky flops Fail Without Login
   [Documentation]  接口名:添加翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin lucky flops fail 403   rule_name=${rule_name}  rule_no=${rule_no}  button_name=${button_name}  flop_day=${flop_day}  flop_week=${flop_week}  price_set=${Please_input}  flop_set=${Please_input}    price_min=${price_min}  price_status=${price_status}  enabled=False  

post admin lucky flop users import Fail Without Login
   [Documentation]  接口名:用户翻牌规则${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   post admin lucky flop users import fail 403   file=${Please_input}    

get admin lucky flops Fail Without Login
   [Documentation]  接口名:获取翻牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin lucky flops fail 403     rule_name=${rule_name}  enabled=False  

get admin lucky flop awards Fail Without Login
   [Documentation]  接口名:翻牌数据${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin lucky flop awards fail 403     lucky_flop_id=${lucky_flop_id}  user_id=${user_id}  rule_no=${rule_no}  parking_name=${parking_name}  status=${status}  

get admin lucky flops by lucky flop id Fail Without Login
   [Documentation]  接口名:幸运翻牌详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   get admin lucky flops by lucky flop id fail 403     lucky_flop_id=${lucky_flop_id}

get admin lucky flop default Fail Without Login
   [Documentation]  接口名:新用户翻牌${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
    get admin lucky flop default fail 403

put admin lucky flops by lucky flop id Fail Without Login
   [Documentation]  接口名:修改翻牌${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin lucky flops by lucky flop id fail 403     lucky_flop_id=${lucky_flop_id}  rule_name=${rule_name}  rule_no=${rule_no}  button_name=${button_name}  flop_day=${flop_day}  flop_week=${flop_week}  price_set=${Please_input}  flop_set=${Please_input}    price_min=${price_min}  price_status=${price_status}  enabled=False  

put admin lucky flop default by lucky flop default id Fail Without Login
   [Documentation]  接口名:修改新用户规则${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   put admin lucky flop default by lucky flop default id fail 403     lucky_flop_default_id=${lucky_flop_default_id}    lucky_flop_id=${lucky_flop_id}  

patch admin lucky flops enabled by lucky flop id Fail Without Login
   [Documentation]  接口名:翻牌启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin lucky flops enabled by lucky flop id fail 403     lucky_flop_id=${lucky_flop_id}  enabled=False    

patch admin lucky flop default enabled Fail Without Login
   [Documentation]  接口名:新用户翻牌启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   patch admin lucky flop default enabled fail 403   enabled=False    

delete admin lucky flops by lucky flop id Fail Without Login
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:未登录,http响应码返回 403,无Json数据返回。
   [Tags]           Respcode:403
   delete admin lucky flops by lucky flop id fail 403     lucky_flop_id=${lucky_flop_id}


*** Variables ***
${lucky_flop_id}  1a2b3c4d5e6f7zz
${lucky_flop_default_id}  1a2b3c4d5e6f7zz


*** Keywords ***
post admin lucky flops Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin lucky flops  &{kwargs}
   expect status is 403  ${resp}  

post admin lucky flop users import Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  post admin lucky flop users import  &{kwargs}
   expect status is 403  ${resp}  

get admin lucky flops Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flops  &{kwargs}
   expect status is 403  ${resp}  

get admin lucky flop awards Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flop awards  &{kwargs}
   expect status is 403  ${resp}  

get admin lucky flops by lucky flop id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flops by lucky flop id  &{kwargs}
   expect status is 403  ${resp}  

get admin lucky flop default Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flop default  &{kwargs}
   expect status is 403  ${resp}  

put admin lucky flops by lucky flop id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flops by lucky flop id  &{kwargs}
   expect status is 403  ${resp}  

put admin lucky flop default by lucky flop default id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flop default by lucky flop default id  &{kwargs}
   expect status is 403  ${resp}  

patch admin lucky flops enabled by lucky flop id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin lucky flops enabled by lucky flop id  &{kwargs}
   expect status is 403  ${resp}  

patch admin lucky flop default enabled Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  patch admin lucky flop default enabled  &{kwargs}
   expect status is 403  ${resp}  

delete admin lucky flops by lucky flop id Fail 403
   [Arguments]  &{kwargs}
   ${resp}=  delete admin lucky flops by lucky flop id  &{kwargs}
   expect status is 403  ${resp}  

