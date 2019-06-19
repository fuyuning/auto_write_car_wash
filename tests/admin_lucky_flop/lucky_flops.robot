*** Settings ***
Documentation  admin_lucky_flop
Resource  ../resources.robot
Library  robot_car_wash_server_library.lucky_flop.LuckyFlopLibrary
Suite Setup  Login  ${username}   ${password}
Suite Teardown  Logout
Force Tags  model:admin_lucky_flop  虾洗后台


*** Test Cases ***
post admin lucky flops Success 
   [Documentation]  接口名:添加翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 201,返回的Json数据符合验证。
   [Tags]           Respcode:201
   ${essential_params}  create dictionary  rule_name=${rule_name}  rule_no=${rule_no}  button_name=${button_name}  flop_day=${flop_day}  flop_week=${flop_week}  price_set=${Please_input}  flop_set=${Please_input}  
   ${unessential_params}  create dictionary  price_min=${price_min}  price_status=${price_status}  enabled=False  
   run every case by params   post admin lucky flops success 201   ${essential_params}  ${unessential_params}

post admin lucky flops Fail With Wrong Params
   [Documentation]  接口名:添加翻牌${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  rule_name=${rule_name_422}  rule_no=${rule_no_422}  button_name=${button_name_422}  flop_day=${flop_day_422}  flop_week=${flop_week_422}  price_set=${Please_input}  flop_set=${Please_input}  
   ${unessential_params}  create dictionary  price_min=${price_min_422}  price_status=${price_status_422}  enabled=ThisIsRobot!  
   run every case by params   post admin lucky flops fail 422   ${essential_params}  ${unessential_params}  success=False

post admin lucky flop users import Success 
   [Documentation]  接口名:用户翻牌规则${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为  列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  file=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin lucky flop users import success 200   ${essential_params}  ${unessential_params}

post admin lucky flop users import Fail With Wrong Params
   [Documentation]  接口名:用户翻牌规则${\n}
   ...              请求方式:Post${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  file=${Please_input}  
   ${unessential_params}  create dictionary  
   run every case by params   post admin lucky flop users import fail 422   ${essential_params}  ${unessential_params}  success=False

get admin lucky flops Success 
   [Documentation]  接口名:获取翻牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LuckyFlop 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  rule_name=${rule_name}  enabled=False  
   run every case by params   get admin lucky flops success 200   ${essential_params}  ${unessential_params}

get admin lucky flops Fail With Wrong Params
   [Documentation]  接口名:获取翻牌列表${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  rule_name=${rule_name_422}  enabled=ThisIsRobot!  
   run every case by params   get admin lucky flops fail 422   ${essential_params}  ${unessential_params}  success=False

get admin lucky flop awards Fail With Wrong Params
   [Documentation]  接口名:翻牌数据${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  lucky_flop_id=${lucky_flop_id_422}  user_id=${user_id_422}  rule_no=${rule_no_422}  parking_name=${parking_name_422}  status=${status_422}  
   run every case by params   get admin lucky flop awards fail 422   ${essential_params}  ${unessential_params}  success=False

get admin lucky flop awards Success 
   [Documentation]  接口名:翻牌数据${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LuckyFlopAward 列表。
   [Tags]           Respcode:200
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  lucky_flop_id=${lucky_flop_id}  user_id=${user_id}  rule_no=${rule_no}  parking_name=${parking_name}  status=${status}  
   run every case by params   get admin lucky flop awards success 200   ${essential_params}  ${unessential_params}

get admin lucky flops by lucky flop id Fail With Wrong Url
   [Documentation]  接口名:幸运翻牌详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   get admin lucky flops by lucky flop id fail 404     lucky_flop_id=${wrong_url_id}

get admin lucky flops by lucky flop id Success 
   [Documentation]  接口名:幸运翻牌详情${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LuckyFlop 对象。
   [Tags]           Respcode:200
   get admin lucky flops by lucky flop id success 200     lucky_flop_id=${lucky_flop_id}

get admin lucky flop default Success 
   [Documentation]  接口名:新用户翻牌${\n}
   ...              请求方式:Get${\n}
   ...              预期结果:输入正确参数,http响应码返回 200,返回的Json数据为 LuckyFlopDefault 列表。
   [Tags]           Respcode:200
    get admin lucky flop default success 200

put admin lucky flops by lucky flop id Fail With Wrong Url
   [Documentation]  接口名:修改翻牌${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin lucky flops by lucky flop id fail 404     lucky_flop_id=${wrong_url_id}  rule_name=${rule_name}  rule_no=${rule_no}  button_name=${button_name}  flop_day=${flop_day}  flop_week=${flop_week}  price_set=${Please_input}  flop_set=${Please_input}    price_min=${price_min}  price_status=${price_status}  enabled=False  

put admin lucky flops by lucky flop id Success 
   [Documentation]  接口名:修改翻牌${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  rule_name=${rule_name}  rule_no=${rule_no}  button_name=${button_name}  flop_day=${flop_day}  flop_week=${flop_week}  price_set=${Please_input}  flop_set=${Please_input}  
   ${unessential_params}  create dictionary  price_min=${price_min}  price_status=${price_status}  enabled=False  
   run every case by params   put admin lucky flops by lucky flop id success 204   ${essential_params}  ${unessential_params}    lucky_flop_id=${lucky_flop_id}

put admin lucky flops by lucky flop id Fail With Wrong Params
   [Documentation]  接口名:修改翻牌${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  rule_name=${rule_name_422}  rule_no=${rule_no_422}  button_name=${button_name_422}  flop_day=${flop_day_422}  flop_week=${flop_week_422}  price_set=${Please_input}  flop_set=${Please_input}  
   ${unessential_params}  create dictionary  price_min=${price_min_422}  price_status=${price_status_422}  enabled=ThisIsRobot!  
   run every case by params   put admin lucky flops by lucky flop id fail 422   ${essential_params}  ${unessential_params}    lucky_flop_id=${lucky_flop_id}  success=False

put admin lucky flop default by lucky flop default id Fail With Wrong Url
   [Documentation]  接口名:修改新用户规则${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   put admin lucky flop default by lucky flop default id fail 404     lucky_flop_default_id=${wrong_url_id}    lucky_flop_id=${lucky_flop_id}  

put admin lucky flop default by lucky flop default id Success 
   [Documentation]  接口名:修改新用户规则${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  lucky_flop_id=${lucky_flop_id}  
   run every case by params   put admin lucky flop default by lucky flop default id success 204   ${essential_params}  ${unessential_params}    lucky_flop_default_id=${lucky_flop_default_id}

put admin lucky flop default by lucky flop default id Fail With Wrong Params
   [Documentation]  接口名:修改新用户规则${\n}
   ...              请求方式:Put${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  
   ${unessential_params}  create dictionary  lucky_flop_id=${lucky_flop_id_422}  
   run every case by params   put admin lucky flop default by lucky flop default id fail 422   ${essential_params}  ${unessential_params}    lucky_flop_default_id=${lucky_flop_default_id}  success=False

patch admin lucky flops enabled by lucky flop id Fail With Wrong Url
   [Documentation]  接口名:翻牌启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   patch admin lucky flops enabled by lucky flop id fail 404     lucky_flop_id=${wrong_url_id}  enabled=False    

patch admin lucky flops enabled by lucky flop id Success 
   [Documentation]  接口名:翻牌启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  enabled=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin lucky flops enabled by lucky flop id success 204   ${essential_params}  ${unessential_params}    lucky_flop_id=${lucky_flop_id}

patch admin lucky flops enabled by lucky flop id Fail With Wrong Params
   [Documentation]  接口名:翻牌启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  enabled=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin lucky flops enabled by lucky flop id fail 422   ${essential_params}  ${unessential_params}    lucky_flop_id=${lucky_flop_id}  success=False

patch admin lucky flop default enabled Success 
   [Documentation]  接口名:新用户翻牌启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   ${essential_params}  create dictionary  enabled=False  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin lucky flop default enabled success 204   ${essential_params}  ${unessential_params}

patch admin lucky flop default enabled Fail With Wrong Params
   [Documentation]  接口名:新用户翻牌启用/关闭${\n}
   ...              请求方式:Patch${\n}
   ...              预期结果:输入错误参数,http响应码返回 422,返回的Json数据为错误信息。
   [Tags]           Respcode:422
   ${essential_params}  create dictionary  enabled=ThisIsRobot!  
   ${unessential_params}  create dictionary  
   run every case by params   patch admin lucky flop default enabled fail 422   ${essential_params}  ${unessential_params}  success=False

delete admin lucky flops by lucky flop id Fail With Wrong Url
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数及错误的url,http响应码返回 404,无Json数据返回。
   [Tags]           Respcode:404
   delete admin lucky flops by lucky flop id fail 404     lucky_flop_id=${wrong_url_id}

delete admin lucky flops by lucky flop id Success 
   [Documentation]  接口名:转盘删除${\n}
   ...              请求方式:Delete${\n}
   ...              预期结果:输入正确参数,http响应码返回 204,无Json数据返回。
   [Tags]           Respcode:204
   delete admin lucky flops by lucky flop id success 204     lucky_flop_id=${lucky_flop_id}


*** Variables ***
${lucky_flop_id}  
${lucky_flop_default_id}  


*** Keywords ***
post admin lucky flops Success 201
   [Arguments]  &{kwargs}
   ${resp}=  post admin lucky flops  &{kwargs}
   expect status is 201  ${resp}  admin_lucky_flop/post_admin_lucky_flops_201.json
   ${lucky_flop_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_id']}
   set global variable   ${lucky_flop_id}
   ${lucky_flop_default_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_default_id']}
   set global variable   ${lucky_flop_default_id}

post admin lucky flops Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin lucky flops  &{kwargs}
   expect status is 422  ${resp}  

post admin lucky flop users import Success 200
   [Arguments]  &{kwargs}
   ${resp}=  post admin lucky flop users import  &{kwargs}
   expect status is 200  ${resp}  admin_lucky_flop/post_admin_lucky_flop_users_import_200.json
   ${lucky_flop_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_id']}
   set global variable   ${lucky_flop_id}
   ${lucky_flop_default_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_default_id']}
   set global variable   ${lucky_flop_default_id}

post admin lucky flop users import Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  post admin lucky flop users import  &{kwargs}
   expect status is 422  ${resp}  

get admin lucky flops Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flops  &{kwargs}
   expect status is 200  ${resp}  admin_lucky_flop/get_admin_lucky_flops_200.json
   ${lucky_flop_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_id']}
   set global variable   ${lucky_flop_id}
   ${lucky_flop_default_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_default_id']}
   set global variable   ${lucky_flop_default_id}

get admin lucky flops Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flops  &{kwargs}
   expect status is 422  ${resp}  

get admin lucky flop awards Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flop awards  &{kwargs}
   expect status is 422  ${resp}  

get admin lucky flop awards Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flop awards  &{kwargs}
   expect status is 200  ${resp}  admin_lucky_flop/get_admin_lucky_flop_awards_200.json
   ${lucky_flop_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_id']}
   set global variable   ${lucky_flop_id}
   ${lucky_flop_default_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_default_id']}
   set global variable   ${lucky_flop_default_id}

get admin lucky flops by lucky flop id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flops by lucky flop id  &{kwargs}
   expect status is 404  ${resp}  

get admin lucky flops by lucky flop id Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flops by lucky flop id  &{kwargs}
   expect status is 200  ${resp}  admin_lucky_flop/get_admin_lucky_flops_by_lucky_flop_id_200.json
   ${lucky_flop_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_id']}
   set global variable   ${lucky_flop_id}
   ${lucky_flop_default_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_default_id']}
   set global variable   ${lucky_flop_default_id}

get admin lucky flop default Success 200
   [Arguments]  &{kwargs}
   ${resp}=  get admin lucky flop default  &{kwargs}
   expect status is 200  ${resp}  admin_lucky_flop/get_admin_lucky_flop_default_200.json
   ${lucky_flop_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_id']}
   set global variable   ${lucky_flop_id}
   ${lucky_flop_default_id}  set variable if  ${resp.json()}!=[]  ${resp.json()[0]['lucky_flop_default_id']}
   set global variable   ${lucky_flop_default_id}

put admin lucky flops by lucky flop id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flops by lucky flop id  &{kwargs}
   expect status is 404  ${resp}  

put admin lucky flops by lucky flop id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flops by lucky flop id  &{kwargs}
   expect status is 204  ${resp}  

put admin lucky flops by lucky flop id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flops by lucky flop id  &{kwargs}
   expect status is 422  ${resp}  

put admin lucky flop default by lucky flop default id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flop default by lucky flop default id  &{kwargs}
   expect status is 404  ${resp}  

put admin lucky flop default by lucky flop default id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flop default by lucky flop default id  &{kwargs}
   expect status is 204  ${resp}  

put admin lucky flop default by lucky flop default id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  put admin lucky flop default by lucky flop default id  &{kwargs}
   expect status is 422  ${resp}  

patch admin lucky flops enabled by lucky flop id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  patch admin lucky flops enabled by lucky flop id  &{kwargs}
   expect status is 404  ${resp}  

patch admin lucky flops enabled by lucky flop id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin lucky flops enabled by lucky flop id  &{kwargs}
   expect status is 204  ${resp}  

patch admin lucky flops enabled by lucky flop id Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin lucky flops enabled by lucky flop id  &{kwargs}
   expect status is 422  ${resp}  

patch admin lucky flop default enabled Success 204
   [Arguments]  &{kwargs}
   ${resp}=  patch admin lucky flop default enabled  &{kwargs}
   expect status is 204  ${resp}  

patch admin lucky flop default enabled Fail 422
   [Arguments]  &{kwargs}
   ${resp}=  patch admin lucky flop default enabled  &{kwargs}
   expect status is 422  ${resp}  

delete admin lucky flops by lucky flop id Fail 404
   [Arguments]  &{kwargs}
   ${resp}=  delete admin lucky flops by lucky flop id  &{kwargs}
   expect status is 404  ${resp}  

delete admin lucky flops by lucky flop id Success 204
   [Arguments]  &{kwargs}
   ${resp}=  delete admin lucky flops by lucky flop id  &{kwargs}
   expect status is 204  ${resp}  

